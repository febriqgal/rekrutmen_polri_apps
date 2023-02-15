import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rekrutmentpolri/app/routes/app_pages.dart';
import 'package:rekrutmentpolri/const.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 32),
          // LOGIN
          LottieBuilder.asset('assets/login.json'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                controller: controller.emailLC,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black,
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  prefixIcon: const Icon(Icons.person, color: Colors.grey),
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                controller: controller.passwordLC,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Colors.black,
                obscureText: true,
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  prefixIcon: const Icon(Icons.password, color: Colors.grey),
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Belum punya akun?',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Container(
                        height: Get.height,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  width: 100,
                                  height: 5,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  // DAFTAR
                                  TextField(
                                    controller: controller.emailDC,
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.black,
                                    autocorrect: false,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person,
                                          color: Colors.grey),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller: controller.passwordDC,
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor: Colors.black,
                                    obscureText: true,
                                    autocorrect: false,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.password,
                                          color: Colors.grey),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: Get.width,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 4,
                                        backgroundColor: kColorPrimary,
                                      ),
                                      onPressed: () {},
                                      child: const Text('Daftar'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  'Daftar!',
                  style: TextStyle(
                    color: kColorPrimary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: Get.width,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: kColorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                ),
                onPressed: () {
                  Get.offAllNamed(Routes.BOTTOM_PAGE);
                },
                child: const Text('Login'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'Atau',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: Get.width,
              height: 40,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: kColorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  disabledForegroundColor: Colors.white.withOpacity(0.38),
                  side: BorderSide(color: kColorPrimary),
                ),
                onPressed: () async {
                  Get.dialog(
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                  await controller.signInWithGoogle();
                },
                icon: SvgPicture.asset('assets/google.svg'),
                label: const Text(
                  'Login dengan Google,',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: Get.width,
              height: 40,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: kColorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  disabledForegroundColor: Colors.white.withOpacity(0.38),
                  side: BorderSide(color: kColorPrimary),
                ),
                onPressed: () async {
                  Get.offAllNamed(Routes.BOTTOM_PAGE);
                },
                child: const Text(
                  'Masuk tanpa akun',
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Center(
            child: Text('Project by: Febproject🔥',
                style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
