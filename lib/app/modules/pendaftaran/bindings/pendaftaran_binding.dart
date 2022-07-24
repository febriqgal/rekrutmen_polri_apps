import 'package:get/get.dart';

import '../controllers/pendaftaran_controller.dart';

class PendaftaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendaftaranController>(
      () => PendaftaranController(),
    );
  }
}
