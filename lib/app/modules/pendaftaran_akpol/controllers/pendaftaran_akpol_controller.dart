import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PendaftaranAkpolController extends GetxController {
  TextEditingController nikC = TextEditingController();
  TextEditingController waktuTerbitKTPC = TextEditingController();
  TextEditingController fileKetDukcapilC = TextEditingController();
  TextEditingController namaLengkapC = TextEditingController();
  TextEditingController jenisKelamainC = TextEditingController();
  TextEditingController tempatLahirC = TextEditingController();
  TextEditingController tanggalLahirC = TextEditingController();
  TextEditingController golonganDarahC = TextEditingController();
  TextEditingController agamaC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController kelurahanC = TextEditingController();
  TextEditingController kecamatanC = TextEditingController();
  TextEditingController kabupatenC = TextEditingController();
  TextEditingController provinsiC = TextEditingController();
  Future<void> bukaLink() async {
    const url =
        'https://penerimaan.polri.go.id/uploads/pdf/PENGUMUMAN_PENERIMAAN_BINTARA_TA_2022.pdf';
    // ignore: deprecated_member_use
    if (!await launch(
      url,
    )) {
      throw 'Could not launch $url';
    }
  }

  List<String> provinsi = <String>[
    "Aceh",
    "Bali",
    "Banten",
    "Bengkulu",
    "DKI Yogyakarta",
    "DKI Jakarta",
    "Gorontalo",
    "Jambi",
    "Jawa Barat",
    "Jawa Tengah",
    "Jawa Timur",
    "Kalimantan Barat",
    "Kalimantan Selatan",
    "Kalimantan Tengah",
    "Kalimantan Timur",
    "Kalimantan Utara",
    "Kepulauan Bangka Belitung",
    "Kepulauan Riau",
    "Lampung",
    "Maluku",
    "Maluku Utara",
    "Nusa Tenggara Barat",
    "Nusa Tenggara Timur",
    "Papua",
    "Papua Barat",
    "Riau",
    "Sulawesi Barat",
    "Sulawesi Selatan",
    "Sulawesi Tengah",
    "Sulawesi Tenggara",
    "Sulawesi Utara",
    "Sumatera Barat",
    "Sumatera Selatan",
    "Sumatera Utara",
  ];
}
