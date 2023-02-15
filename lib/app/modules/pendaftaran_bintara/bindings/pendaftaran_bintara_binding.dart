import 'package:get/get.dart';

import '../controllers/pendaftaran_bintara_controller.dart';

class PendaftaranBintaraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendaftaranBintaraController>(
      () => PendaftaranBintaraController(),
    );
  }
}
