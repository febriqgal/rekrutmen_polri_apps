import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BeritaController extends GetxController {
  Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance
      .collection('berita')
      .orderBy('urutan', descending: true)
      .snapshots();
}
