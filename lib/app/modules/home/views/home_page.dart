import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rekrutmentpolri/app/modules/home/controllers/home_controller.dart';
import 'package:rekrutmentpolri/app/routes/app_pages.dart';
import 'package:rekrutmentpolri/const.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final homeC = Get.put(HomeController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.TAMBAH_INFORMASI);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // ignore: unnecessary_null_comparison
              user != null
                  ? 'Hi, ${user.displayName?.split(' ').first}!'
                  : 'Hello, Gesssss!',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('${homeC.salam()}')
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 9,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            child: CarouselSlider(
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/image/jalur_akpol.png',
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/image/jalur_bintara.png',
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/image/jalur_sipss.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/image/jalur_tamtama.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
              options: CarouselOptions(
                viewportFraction: 0.9,
                height: 150,
                autoPlay: true,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 9,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 16, right: 16, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Informasi Terbaru',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.BERITA);
                        },
                        child: Text(
                          'Lihat Semua',
                          style: TextStyle(
                            color: kColorPrimary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeC.informasiTerbaru.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        Get.toNamed(Routes.BERITA,
                            arguments: homeC.informasiTerbaru[index]);
                      },
                      contentPadding: const EdgeInsets.only(right: 16),
                      leading: Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            homeC.informasiTerbaru[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        '${index + 1}. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text('2${index + 1}/07/2022'),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 9,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                // TEXT GALLERY POLRI
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 16, right: 16, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Gallery Kegiatan',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.GALLERY);
                        },
                        child: Text(
                          'Lihat Semua',
                          style: TextStyle(
                            color: kColorPrimary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // GALLERY POLRI
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeC.informasiTerbaru.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.GALLERY,
                              arguments: homeC.informasiTerbaru[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              homeC.informasiTerbaru[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
