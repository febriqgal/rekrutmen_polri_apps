import 'package:get/get.dart';

import '../controllers/petunjuk_controller.dart';

class PetunjukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetunjukController>(
      () => PetunjukController(),
    );
  }
}
