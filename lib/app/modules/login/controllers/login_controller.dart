import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rekrutmentpolri/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailLC = TextEditingController();
  TextEditingController passwordLC = TextEditingController();
  TextEditingController emailDC = TextEditingController();
  TextEditingController passwordDC = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    Get.offAllNamed(Routes.BOTTOM_PAGE);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
