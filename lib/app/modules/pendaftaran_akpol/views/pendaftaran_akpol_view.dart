import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rekrutmentpolri/const.dart';
import '../controllers/pendaftaran_akpol_controller.dart';

class PendaftaranAkpolView extends GetView<PendaftaranAkpolController> {
  const PendaftaranAkpolView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran AKPOL'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                          controller.bukaLink();
                        },
                        child: const Text('DOWNLOAD DISINI',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Data Diri Perserta',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          // NIK
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'NIK',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Foto KTP
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.photo_camera),
                      onPressed: () {},
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Foto KTP'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Waktu Penerbitan E-KTP*
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      enabled: false,
                      autocorrect: false,
                      controller: controller.waktuTerbitKTPC,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Waktu Penerbitan E-KTP*'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                  onPressed: () {
                    showDatePicker(
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      initialDatePickerMode: DatePickerMode.day,
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime.now(),
                      // 100 years
                    ).then((value) => controller.waktuTerbitKTPC.text =
                        DateFormat('dd/MM/yyyy').format(value!));
                  },
                  icon: Icon(
                    Icons.date_range,
                    color: kColorPrimary,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'File Keterangan Disdukcapil',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Nama Lengkap',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Jenis Kelamin'),
                items: const [
                  DropdownMenuItem(
                    child: Text('Pria'),
                    value: 'Pria',
                  ),
                  DropdownMenuItem(
                    child: Text('Wanita'),
                    value: 'Wanita',
                  ),
                ],
                onChanged: (Object? value) {
                  if (value == 'Pria') {
                    controller.jenisKelamainC.text = 'Pria';
                  } else {
                    controller.jenisKelamainC.text = 'Wanita';
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Tempat lahir',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      enabled: false,
                      autocorrect: false,
                      controller: controller.tanggalLahirC,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Tanggal Lahir'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                  onPressed: () {
                    showDatePicker(
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      initialDatePickerMode: DatePickerMode.day,
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime.now(),
                      // 100 years
                    ).then((value) => controller.tanggalLahirC.text =
                        DateFormat('dd/MM/yyyy').format(value!));
                  },
                  icon: Icon(Icons.date_range, color: kColorPrimary),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Golongan darah',
                ),
                items: const [
                  DropdownMenuItem(
                    child: Text('A'),
                    value: 'A',
                  ),
                  DropdownMenuItem(
                    child: Text('B'),
                    value: 'B',
                  ),
                  DropdownMenuItem(
                    child: Text('AB'),
                    value: 'AB',
                  ),
                  DropdownMenuItem(
                    child: Text('O'),
                    value: 'O',
                  ),
                ],
                onChanged: (Object? value) {
                  if (value == 'A') {
                    controller.agamaC.text = 'A';
                  } else if (value == 'B') {
                    controller.agamaC.text = 'B';
                  } else if (value == 'AB') {
                    controller.agamaC.text = 'AB';
                  } else if (value == 'O') {
                    controller.agamaC.text = 'O';
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Agama'),
                items: const [
                  DropdownMenuItem(
                    child: Text('Islam'),
                    value: 'Islam',
                  ),
                  DropdownMenuItem(
                    child: Text('Kristen'),
                    value: 'Kristen',
                  ),
                  DropdownMenuItem(
                    child: Text('Hindu'),
                    value: 'Hindu',
                  ),
                  DropdownMenuItem(
                    child: Text('Buddha'),
                    value: 'Buddha',
                  ),
                  DropdownMenuItem(
                    child: Text('Kristen Protestan'),
                    value: 'Kristen Protestan',
                  ),
                  DropdownMenuItem(
                    child: Text('Kristen Katolik'),
                    value: 'Kristen Katolik',
                  ),
                  DropdownMenuItem(
                    child: Text('Lainnya'),
                    value: 'Lainnya',
                  ),
                ],
                onChanged: (Object? value) {
                  if (value == 'Islam') {
                    controller.agamaC.text = 'Islam';
                  } else if (value == 'Kristen') {
                    controller.agamaC.text = 'Kristen';
                  } else if (value == 'Hindu') {
                    controller.agamaC.text = 'Hindu';
                  } else if (value == 'Buddha') {
                    controller.agamaC.text = 'Buddha';
                  } else if (value == 'Kristen Protestan') {
                    controller.agamaC.text = 'Kristen Protestan';
                  } else if (value == 'Kristen Katolik') {
                    controller.agamaC.text = 'Kristen Katolik';
                  } else if (value == 'Lainnya') {
                    controller.agamaC.text = 'Lainnya';
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Alamat',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Kelurahan',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                controller: controller.kecamatanC,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Kecamatan'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Kota/Kabupaten *',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Provinsi (Domisili Sesuai KTP)*'),
                items: controller.provinsi.asMap().entries.map((MapEntry map) {
                  return DropdownMenuItem(
                    child: Text(map.value),
                    value: map.key + 1,
                  );
                }).toList(),
                onChanged: (value) {
                  controller.provinsi.asMap().entries.forEach((MapEntry map) {
                    if (map.key + 1 == value) {
                      controller.provinsiC.text = map.value;
                    }
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Jenis Pekerjaan',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Status Kawin'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Tinggi *',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Berat (kg) *'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Suku',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Hp*',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Email *'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Prestasi',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Bahasa Daerah',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Bahasa Asing'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Apakah anda yakin akan mengirim data ini?',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 64),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 36,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Tidak'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: SizedBox(
                                      height: 36,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              content: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  CircularProgressIndicator(),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Text(
                                                      'Sedang mengirim data...'),
                                                ],
                                              ),
                                            ),
                                          );
                                          await Future.delayed(
                                            const Duration(seconds: 2),
                                            (() {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            }),
                                          );
                                          Navigator.pop(context);
                                          Get.snackbar(
                                            'Sukses',
                                            '${controller.provinsiC.text} : Data berhasil dikirim',
                                            backgroundColor: Colors.white,
                                            snackStyle: SnackStyle.GROUNDED,
                                          );
                                        },
                                        child: const Text('Ya'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  'Daftar',
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
