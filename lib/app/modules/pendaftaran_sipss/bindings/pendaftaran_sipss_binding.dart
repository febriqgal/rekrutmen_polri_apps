import 'package:get/get.dart';

import '../controllers/pendaftaran_sipss_controller.dart';

class PendaftaranSipssBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendaftaranSipssController>(
      () => PendaftaranSipssController(),
    );
  }
}
