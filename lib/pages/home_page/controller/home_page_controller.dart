import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  bool isGoogleSignIn = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignInAccount? googleUser;

  signInGoogle() async {
    // Trigger the authentication flow
    googleUser = await GoogleSignIn().signIn();

    isGoogleSignIn = true;
    update();
    if (googleUser != null) {
      GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential authResult = await auth.signInWithCredential(credential);
      Get.log(
          "Google SignIn Email  :  ${authResult.additionalUserInfo!.username}");
      Get.log(
          "Google SignIn profile  :  ${authResult.additionalUserInfo!.profile}");
      Get.log(
          "Google SignIn isNewUser  :  ${authResult.additionalUserInfo!.isNewUser}");
      Get.log(
          "Google SignIn providerId  :  ${authResult.additionalUserInfo!.providerId}");
      Get.log(
          "Google SignIn signInMethod  :  ${authResult.credential!.signInMethod}");
      Get.log("Google SignIn token  :  ${authResult.credential!.token}");
      Get.log(
          "Google SignIn providerId  :  ${authResult.credential!.providerId}");
      Get.log("Google SignIn displayName  :  ${authResult.user!.displayName}");
      Get.log("Google SignIn email  :  ${authResult.user!.email}");
      Get.log(
          "Google SignIn emailVerified  :  ${authResult.user!.emailVerified}");
      Get.log("Google SignIn phoneNumber  :  ${authResult.user!.phoneNumber}");
      Get.log("Google SignIn photoURL  :  ${authResult.user!.photoURL}");
      Get.log("Google SignIn uid  :  ${authResult.user!.uid}");
    } else {
      Get.log("Error While Logging in Please try again");
      isGoogleSignIn = false;
      update();
    }
  }

  void signOutGoogle() async {
    await auth.signOut();
    log("User Sign Out");
  }
}
