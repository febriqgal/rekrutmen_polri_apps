import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rekrutmentpolri/const.dart';

import '../controllers/berita_controller.dart';

class BeritaView extends GetView<BeritaController> {
  const BeritaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeritaController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Informasi'),
            centerTitle: true,
          ),
          body: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ListTile(
                    title: Text(
                      '${index + 1}. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text('2${index + 1}/07/2022'),
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              kColorPrimary,
                              const Color.fromARGB(255, 187, 141, 3)
                            ],
                          ),
                        ),
                        height: 300,
                        width: 100,
                        child: Center(
                            child: Text(
                          'Foto ${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
