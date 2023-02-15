import 'package:get/get.dart';
import '../modules/berita/bindings/berita_binding.dart';
import '../modules/berita/views/berita_view.dart';
import '../modules/bottomPage/bindings/bottom_page_binding.dart';
import '../modules/bottomPage/views/bottom_page_view.dart';
import '../modules/formpendaftaran/bindings/formpendaftaran_binding.dart';
import '../modules/formpendaftaran/views/formpendaftaran_view.dart';
import '../modules/gallery/bindings/gallery_binding.dart';
import '../modules/gallery/views/gallery_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_page.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pendaftaran/bindings/pendaftaran_binding.dart';
import '../modules/pendaftaran/views/pendaftaran_view.dart';
import '../modules/pendaftaran_akpol/bindings/pendaftaran_akpol_binding.dart';
import '../modules/pendaftaran_akpol/views/pendaftaran_akpol_view.dart';
import '../modules/pendaftaran_bintara/bindings/pendaftaran_bintara_binding.dart';
import '../modules/pendaftaran_bintara/views/pendaftaran_bintara_view.dart';
import '../modules/pendaftaran_sipss/bindings/pendaftaran_sipss_binding.dart';
import '../modules/pendaftaran_sipss/views/pendaftaran_sipss_view.dart';
import '../modules/pendaftaran_tamtama/bindings/pendaftaran_tamtama_binding.dart';
import '../modules/pendaftaran_tamtama/views/pendaftaran_tamtama_view.dart';
import '../modules/petunjuk/bindings/petunjuk_binding.dart';
import '../modules/petunjuk/views/petunjuk_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/tambah_informasi/bindings/tambah_informasi_binding.dart';
import '../modules/tambah_informasi/views/tambah_informasi_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FORMPENDAFTARAN,
      page: () => FormpendaftaranView(),
      binding: FormpendaftaranBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BERITA,
      page: () => const BeritaView(),
      binding: BeritaBinding(),
    ),
    GetPage(
      name: _Paths.PENDAFTARAN,
      page: () => const PendaftaranView(),
      binding: PendaftaranBinding(),
    ),
    GetPage(
      name: _Paths.PENDAFTARAN_AKPOL,
      page: () => const PendaftaranAkpolView(),
      binding: PendaftaranAkpolBinding(),
    ),
    GetPage(
      name: _Paths.PENDAFTARAN_BINTARA,
      page: () => const PendaftaranBintaraView(),
      binding: PendaftaranBintaraBinding(),
    ),
    GetPage(
      name: _Paths.PENDAFTARAN_SIPSS,
      page: () => const PendaftaranSipssView(),
      binding: PendaftaranSipssBinding(),
    ),
    GetPage(
      name: _Paths.PENDAFTARAN_TAMTAMA,
      page: () => const PendaftaranTamtamaView(),
      binding: PendaftaranTamtamaBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PETUNJUK,
      page: () => const PetunjukView(),
      binding: PetunjukBinding(),
    ),
    GetPage(
      name: _Paths.GALLERY,
      page: () => const GalleryView(),
      binding: GalleryBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_PAGE,
      page: () => const BottomPageView(),
      binding: BottomPageBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_INFORMASI,
      page: () => const TambahInformasiView(),
      binding: TambahInformasiBinding(),
    ),
  ];
}
