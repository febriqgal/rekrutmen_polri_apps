import 'package:get/get.dart';

import '../controllers/pendaftaran_tamtama_controller.dart';

class PendaftaranTamtamaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendaftaranTamtamaController>(
      () => PendaftaranTamtamaController(),
    );
  }
}
