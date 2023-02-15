import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/gallery_controller.dart';

class GalleryView extends GetView<GalleryController> {
  const GalleryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.pickfotoberita();
                    },
                    child: const Text('Pilih Gambar'),
                  ),
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: StreamBuilder<QuerySnapshot>(
            stream: controller.collectionStreamGallery,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                List<DocumentSnapshot> gallery =
                    snapshot.data?.docs as List<DocumentSnapshot>;
                return GridView.builder(
                  itemCount: gallery.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          gallery[index]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
