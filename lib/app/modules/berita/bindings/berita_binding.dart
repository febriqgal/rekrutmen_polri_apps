import 'package:get/get.dart';

import '../controllers/berita_controller.dart';

class BeritaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeritaController>(
      () => BeritaController(),
    );
  }
}
