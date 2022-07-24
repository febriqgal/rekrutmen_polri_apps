import 'package:get/get.dart';

import '../controllers/formpendaftaran_controller.dart';

class FormpendaftaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormpendaftaranController>(
      () => FormpendaftaranController(),
    );
  }
}
