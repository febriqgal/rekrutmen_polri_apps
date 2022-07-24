import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rekrutmentpolri/app/routes/app_pages.dart';
import 'package:rekrutmentpolri/const.dart';
import '../controllers/gallery_controller.dart';

class GalleryView extends GetView<GalleryController> {
  const GalleryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.GALLERY_KEGIATAN);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          itemCount: 50,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          kColorPrimary,
                          const Color.fromARGB(255, 187, 141, 3)
                        ],
                      ),
                    ),
                    child: Text(
                      'Foto ${index + 1}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
        ),
      ),
    );
  }
}
