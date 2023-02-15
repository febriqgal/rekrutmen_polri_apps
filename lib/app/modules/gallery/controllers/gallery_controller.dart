import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GalleryController extends GetxController {
  Stream<QuerySnapshot> collectionStreamGallery =
      FirebaseFirestore.instance.collection('gallery').snapshots();
  CollectionReference gallery =
      FirebaseFirestore.instance.collection("gallery");
  final user = FirebaseAuth.instance.currentUser;
  File? imageeee;
  final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker picker = ImagePicker();
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
        final mountainImagesRef = storageRef
            .child("Gallery_Kegiatan/${imageeee.path.split('/').last}");
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'Sedang mengupload...',
        );
        await mountainImagesRef.putFile(
          file,
        );
        gallery.add({
          "image":
              "https://firebasestorage.googleapis.com/v0/b/recruitment-polri.appspot.com/o/Gallery_Kegiatan%2F${imageeee.path.split('/').last}?alt=media&token=bf1aa1a5-1a7e-40f2-ab92-c242ac12b5a5",
          "imaga_name": imageeee.path.split('/').last,
          "createdAt": DateTime.now().toIso8601String(),
        });
        Get.back();
        Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.amber,
            ),
            onPressed: () {
              Get.back();
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
}
