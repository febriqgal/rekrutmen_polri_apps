import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int jam = DateTime.now().hour;
  List item = [
    {
      "title": "Akademi Polisi",
      "subtitle": "Jadwal Seleksi",
      "tanggalPendaftaran": "17/April/2022",
      "tanggalPenutupan": "17/May/2022",
      "image": "assets/image/jalur_akpol.png",
      "color": Colors.green,
      "route": "/akpol"
    },
    {
      "title": "Sekolah Inspektur Polisi Sumber Sarjana",
      "subtitle": "Jadwal Seleksi",
      "tanggalPendaftaran": "17/April/2022",
      "tanggalPenutupan": "17/May/2022",
      "image": "assets/image/jalur_sipss.jpg",
      "color": Colors.blue,
      "route": "/sips"
    },
    {
      "title": "BINTARA POLRI",
      "subtitle": "Jadwal Seleksi",
      "tanggalPendaftaran": "17/April/2022",
      "tanggalPenutupan": "17/May/2022",
      "image": "assets/image/jalur_bintara.png",
      "color": Colors.red,
      "route": "/bintara"
    },
    {
      "title": "TAMTAMA POLRI",
      "subtitle": "Jadwal Seleksi",
      "tanggalPendaftaran": "17/April/2022",
      "tanggalPenutupan": "17/May/2022",
      "image": "assets/image/jalur_tamtama.png",
      "color": Colors.yellow,
      "route": "/tamtama"
    }
  ];
  List sliderItem = [
    {
      'tittle': 'PENERIMAAN POLRI T.A. 2022',
      'image': 'assets/image/aplikasi_cnc.png',
      'subtitle':
          'PENGGUNAAN APLIKASI CNC SDM POLRI SAAT PELAKSANAAN SELEKSI PENERIMAAN ANGGOTA POLRI, SEHINGGA NILAI DAN KEGIATAN PESERTA DAPAT LANGSUNG DIMONITOR OLEH ORANG TUA/WALI DAN PEJABAT YANG BERWENANG MELALUI ANDROID.',
    },
    {
      'tittle': 'WHISTLE BLOWER SYSTEM',
      'image': 'assets/image/aplikasi_wbs.png',
      'subtitle':
          'SISTEM UNTUK MEMPROSES PELAPORAN / PEMBERIAN INFORMASI YANG DISAMPAIKAN BAIK SECARA LANGSUNG MAUPUN TIDAK LANGSUNG SEHUBUNGAN DENGAN ADANYA PERBUATAN YANG MELANGGAR PERUNDANG-UNDANGAN, PERATURAN/STANDAR, KODE ETIK, DAN KEBIJAKAN, SERTA TINDAKAN LAIN YANG SEJENIS BERUPA ANCAMAN LANGSUNG ATAS KEPENTINGAN UMUM, SERTA KORUPSI, KOLUSI, DAN NEPOTISME (KKN) YANG TERJADI DALAM PROSES PENERIMAAN ANGGOTA POLRI.',
    },
    {
      'tittle': '',
      'image': 'assets/image/1.png',
      'subtitle': '',
    }
  ];
  List<String> divisi = [
    'assets/image/jalur_akpol.png',
    'assets/image/jalur_bintara.png',
    'assets/image/jalur_sipss.jpg',
    'assets/image/jalur_tamtama.png',
  ];
  List<String> informasiTerbaru = [
    'assets/image/info1.jpg',
    'assets/image/info2.jpg',
    'assets/image/info3.jpg',
    'assets/image/info4.jpg',
    'assets/image/info5.jpg',
    'assets/image/info6.jpg',
  ];
  salam() {
    if (jam < 12) {
      return 'Selamat Pagi 🌥️';
    } else if (jam < 17) {
      return 'Selamat Siang 🥳';
    } else if (jam < 19) {
      return 'Selamat Sore 🌛';
    } else {
      return 'Selamat Malam 🌙';
    }
  }

  Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance
      .collection('berita')
      .orderBy('urutan', descending: true)
      .snapshots();

       Stream<QuerySnapshot> collectionStreamGallery =
      FirebaseFirestore.instance.collection('gallery').snapshots();
}
