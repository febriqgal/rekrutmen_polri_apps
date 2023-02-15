import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/formpendaftaran_controller.dart';

// ignore: must_be_immutable
class FormpendaftaranView extends GetView<FormpendaftaranController> {
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

  FormpendaftaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pendaftaran'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Registrasi Peserta',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sebelum anda melakukan pendaftaran online pastikan anda melengkapi berkas persyaratan pada link berikut ini.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Get.bottomSheet(Container(
                                color: Colors.white,
                              ));
                            },
                            child: const Text('DOWNLOAD DISINI',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                thickness: 2,
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Data Diri Perserta',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'NIK',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: controller.waktuTerbitKTPC,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Waktu Penerbitan E-KTP*'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                        onTap: () {
                          showDatePicker(
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            initialDatePickerMode: DatePickerMode.day,
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                            // 100 years
                          ).then((value) => controller.waktuTerbitKTPC.text =
                              DateFormat('dd/MM/yyyy').format(value!));
                        },
                        child: const Icon(Icons.calendar_month)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'File Keterangan Disdukcapil',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nama Lengkap',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: controller.jenisKelamainC,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Jenis Kelamin'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Tempat lahir',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: controller.tanggalLahirC,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Tanggal lahir'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                        onTap: () {
                          showDatePicker(
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            initialDatePickerMode: DatePickerMode.day,
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                            // 100 years
                          ).then((value) => controller.tanggalLahirC.text =
                              DateFormat('dd/MM/yyyy').format(value!));
                        },
                        child: const Icon(Icons.calendar_month)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Golongan darah',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: controller.agamaC,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Agama'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Alamat',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Expanded(
                  child: SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Kelurahan',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: controller.kecamatanC,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Kecamatan'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Expanded(
                  child: SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Kota/Kabupaten *',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: controller.provinsiC,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Provinsi (Domisili Sesuai KTP)*'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: const [
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Jenis Pekerjaan',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Status Kawin'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: const [
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tinggi *',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Berat (kg) *'),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Suku',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Row(
              children: const [
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Hp*',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Email *'),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Prestasi',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Bahasa Daerah',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Bahasa Asing'),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Foto'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child:
                ElevatedButton(onPressed: () {}, child: const Text('Daftar')),
          ),
        ],
      ),
    );
  }
}
