import 'package:get/get.dart';

import '../controllers/pendaftaran_akpol_controller.dart';

class PendaftaranAkpolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendaftaranAkpolController>(
      () => PendaftaranAkpolController(),
    );
  }
}
