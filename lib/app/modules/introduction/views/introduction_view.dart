import 'package:flutchat/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Berinteraksi dengan mudah",
            body: "Kamu hanya perlu di rumah saja untuk mendapatkan teman baru",
            image: Container(
              width: Get.width * 0.6,
              height: Get.height * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/main-laptop-duduk.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Temukan sahabat baru",
            body: "Aplikasi ini dapat menemukan teman baru untukmu",
            image: Container(
              width: Get.width * 0.6,
              height: Get.height * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/ojek.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Ayo gunakan langsung",
            body: "Bebas tanpa ribet, gratis dan reliable. Ayo daftar sekarang",
            image: Container(
              width: Get.width * 0.6,
              height: Get.height * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/register.json"),
              ),
            ),
          ),
        ],
        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Text(
          "Next",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        done: const Text("Login", style: TextStyle(fontWeight: FontWeight.w700)),
        onDone: () => Get.offAllNamed(Routes.LOGIN),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
