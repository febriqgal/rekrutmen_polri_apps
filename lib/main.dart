import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rekrutmentpolri/const.dart';
import 'package:rekrutmentpolri/firebase_options.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await initializeDateFormatting('id_ID', null).then((_) => runApp(
        MyApp(),
      ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  MyApp({Key? key}) : super(key: key);
  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return GetMaterialApp(
              theme: ThemeData(
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                useMaterial3: true,
                iconTheme: const IconThemeData(color: Colors.black),
                colorScheme: ColorScheme.light(
                  primary: kColorPrimary,
                  secondary: const Color.fromARGB(255, 255, 255, 255),
                  surface: const Color(0xFFF5F5F5),
                  background: const Color(0xFFF5F5F5),
                  error: const Color(0xFFB00020),
                  onPrimary: const Color.fromARGB(255, 255, 255, 255),
                  onSecondary: const Color(0xFFF5F5F5),
                  onBackground: const Color(0xFFF5F5F5),
                  onError: const Color(0xFFF5F5F5),
                  brightness: Brightness.light,
                ),
              ),
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute:
                  snapshot.data != null && snapshot.data?.emailVerified == true
                      ? Routes.BOTTOM_PAGE //home
                      : Routes.LOGIN, //login
              getPages: AppPages.routes,
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
