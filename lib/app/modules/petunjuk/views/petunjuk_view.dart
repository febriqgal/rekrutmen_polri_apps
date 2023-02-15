import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/petunjuk_controller.dart';

class PetunjukView extends GetView<PetunjukController> {
  const PetunjukView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petunjuk'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('data'),
        ),
      ),
    );
  }
}
