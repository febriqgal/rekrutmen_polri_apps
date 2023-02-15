import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class TambahberitaController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection("berita");
  File? imageeee;
  final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker picker = ImagePicker();
  TextEditingController isiBeritaC = TextEditingController();
  TextEditingController judulBeritaC = TextEditingController();
  TextEditingController sumberC = TextEditingController();

  Future<void> pickfotoberita() async {
    final XFile? imageeee = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (imageeee != null) {
      File file = File(imageeee.path);
      var adminView = this;
      adminView.imageeee = file;
      try {
        final mountainImagesRef =
            storageRef.child("foto_berita/${imageeee.path.split('/').last}");
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'Sedang mengupload...',
        );
        await mountainImagesRef.putFile(
          file,
        );
        Get.back();
        Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          radius: 5,
          title: 'Berhasil',
          middleText: 'Yeayy! berhasil🔥',
        );
      } catch (e) {
        Get.defaultDialog(
            title: 'Pemberitahuan',
            middleText: 'Gagal mengupload, silahkan coba lagi!');
      }
    } else {
      Get.defaultDialog(
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'membatalkan mengupload');
    }
  }

  Future<void> tambahBerita(
      String isiBeritaC, String judulBeritaC, String sumberC) async {
    if (isiBeritaC.isEmpty || judulBeritaC.isEmpty || sumberC.isEmpty) {
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
          child: Text(
            'Kesalahan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        messageText:
            const Center(child: Text('Judul dan isi tidak boleh kosong')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
      );
    } else {
      try {
        await users.add(
          {
            "namapenulis": user?.displayName,
            "photopenulis": user?.photoURL,
            "${user?.uid}": user?.uid,
            "judul": judulBeritaC, // John Doe
            "isi": isiBeritaC, // Stokes and Sons
            "urutan": DateTime.now().toIso8601String(),
            "tanggal": DateFormat("EEEE, d MMMM yyyy", "id_ID")
                .add_Hm()
                .format(DateTime.now())
                .toString(),
            "sumber": sumberC,
            "gambar":
                "https://firebasestorage.googleapis.com/v0/b/rekrutmenpolri-9e6a5.appspot.com/o/foto_berita%2F${imageeee?.path.split('/').last}?alt=media&token=dc081b30-5ee0-4bbc-a714-523d482b9009",
            "namagambar": imageeee?.path.split('/').last,
          },
        );
        Get.back();
      } catch (e) {
        Get.defaultDialog(
            title: 'Pemberitahuan',
            middleText: 'Gagal mengupload, silahkan coba lagi!');
      }
    }
  }
}
