import 'package:get/get.dart';

import '../controllers/bottom_page_controller.dart';

class BottomPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomPageController>(
      () => BottomPageController(),
    );
  }
}
