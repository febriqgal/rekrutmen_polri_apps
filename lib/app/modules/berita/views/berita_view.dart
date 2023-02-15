import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rekrutmentpolri/app/routes/app_pages.dart';

import '../controllers/berita_controller.dart';

class BeritaView extends GetView<BeritaController> {
  const BeritaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.TAMBAH_INFORMASI);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Informasi'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: controller.collectionStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              List<DocumentSnapshot> semuaStory =
                  snapshot.data?.docs as List<DocumentSnapshot>;
              return ListView.builder(
                itemCount: semuaStory.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ListTile(
                      title: Text(
                        semuaStory[index]['judul'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        semuaStory[index]['tanggal'],
                      ),
                      trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                          height: 300,
                          width: 100,
                          child: Image.network(
                            semuaStory[index]['gambar'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
