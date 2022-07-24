import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gallery_kegiatan_controller.dart';

class GalleryKegiatanView extends GetView<GalleryKegiatanController> {
  const GalleryKegiatanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GalleryKegiatanView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton.icon(
            onPressed: () {
              controller.pickfotoberita();
            },
            icon: const Icon(Icons.camera_alt),
            label: const Text('Pilih Gambar Berita')),
      ),
    );
  }
}
