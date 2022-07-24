import 'package:get/get.dart';

import '../controllers/tambah_informasi_controller.dart';

class TambahInformasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahberitaController>(
      () => TambahberitaController(),
    );
  }
}
