import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rekrutmentpolri/app/modules/profile/views/editprofile.dart';
import 'package:rekrutmentpolri/app/routes/app_pages.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final googleUser = GoogleSignIn();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 32),
                ClipOval(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: user == null
                        ? Image.asset('assets/image/defaultprofile.jpg',
                            fit: BoxFit.cover)
                        : Image.network(user.photoURL.toString(),
                            fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  user?.displayName?.toUpperCase() ?? 'Tamu',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  user?.email ?? '-',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                ListTile(
                  onTap: () {
                    user != null
                        ? Get.to(() => const EditProfilePage())
                        : Get.snackbar('Kesalahan',
                            'Anda belum login, silahkan login terlebih dahulu.',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            borderRadius: 8,
                            margin: const EdgeInsets.all(8),
                            colorText: Colors.white,
                            icon: const Icon(Icons.error, color: Colors.white));
                  },
                  leading: const Icon(Icons.person),
                  title: const Text('Edit Profile'),
                  subtitle:
                      const Text('ubah nama, foto profile, dan password.'),
                  trailing: const Icon(Icons.arrow_right),
                ),
                const ListTile(
                  leading: Icon(Icons.device_unknown),
                  title: Text('Version'),
                  subtitle: Text('1.0.0'),
                ),
                user != null
                    ? ListTile(
                        onTap: () async {
                          await googleUser.signOut();
                          await FirebaseAuth.instance.signOut();
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        title: const Center(
                          child: Text(
                            'Keluar',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        onTap: () async {
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        title: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
