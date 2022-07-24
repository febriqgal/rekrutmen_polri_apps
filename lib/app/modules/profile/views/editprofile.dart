import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rekrutmentpolri/app/modules/profile/views/ubah_foto_profile.dart';
import 'package:rekrutmentpolri/app/modules/profile/views/ubah_nama.dart';
import 'package:rekrutmentpolri/app/modules/profile/views/ubah_password.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Get.to(() => const UbahNamePage());
            },
            title: const Text('Ubah Nama'),
            trailing: const Icon(Icons.arrow_right),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          ListTile(
            onTap: () {
              Get.to(() => const UbahFotoProfilePage());
            },
            title: const Text('Ubah Foto Profile'),
            trailing: const Icon(Icons.arrow_right),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          ListTile(
            onTap: () {
              Get.to(() => const UbahPasswordPage());
            },
            title: const Text('Ubah Password'),
            trailing: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}
