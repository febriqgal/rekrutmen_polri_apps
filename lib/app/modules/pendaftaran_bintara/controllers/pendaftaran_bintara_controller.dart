import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PendaftaranBintaraController extends GetxController {
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
}
