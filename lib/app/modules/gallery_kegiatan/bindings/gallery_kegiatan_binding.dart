import 'package:get/get.dart';

import '../controllers/gallery_kegiatan_controller.dart';

class GalleryKegiatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GalleryKegiatanController>(
      () => GalleryKegiatanController(),
    );
  }
}
