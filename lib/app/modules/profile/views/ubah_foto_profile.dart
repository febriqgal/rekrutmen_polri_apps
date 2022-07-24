import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:rekrutmentpolri/const.dart';

class UbahFotoProfilePage extends StatelessWidget {
  const UbahFotoProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Ubah Foto Profile'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ClipOval(
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(user!.photoURL.toString(),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: kColorPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      Text(
                        ' Pilh Foto',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Divider(
                color: Colors.black38,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {},
                child: const Text('Kirim'),
              ),
            )
          ],
        ));
  }
}
