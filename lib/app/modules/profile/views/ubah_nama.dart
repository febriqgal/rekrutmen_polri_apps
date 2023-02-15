import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbahNamePage extends StatelessWidget {
  const UbahNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    TextEditingController ubahNamaC = TextEditingController(
      text: user?.displayName,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ubah Nama'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: ubahNamaC,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ElevatedButton(
                  onPressed: () async {
                    await user?.updateDisplayName(ubahNamaC.text);
                    Get.back();
                  },
                  child: const Text('Kirim')),
            )
          ],
        ));
  }
}
