import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rekrutmentpolri/app/routes/app_pages.dart';

class UbahPasswordPage extends StatelessWidget {
  const UbahPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHide = true.obs;
    final googleUser = GoogleSignIn();
    final user = FirebaseAuth.instance.currentUser;
    TextEditingController ubahPasswordC = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ubah Password'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(() => TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isHide.value,
                    controller: ubahPasswordC,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            isHide.toggle();
                          },
                          icon: const Icon(Icons.remove_red_eye)),
                      labelText: 'ubah password',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      border: const UnderlineInputBorder(),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ElevatedButton(
                  onPressed: () async {
                    await user?.updatePassword(ubahPasswordC.text);
                    await googleUser.signOut();
                    await FirebaseAuth.instance.signOut();
                    Get.offAllNamed(Routes.LOGIN);
                    Get.snackbar('Berhasil',
                        'Password berhasil diubah, silahkan login kembali');
                  },
                  child: const Text('Kirim')),
            )
          ],
        ));
  }
}
