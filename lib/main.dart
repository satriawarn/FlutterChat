import 'package:firebase_core/firebase_core.dart';
import 'package:flutchat/app/controllers/auth_controller.dart';
import 'package:flutchat/app/utils/error_screen.dart';
import 'package:flutchat/app/utils/loading_screen.dart';
import 'package:flutchat/app/utils/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorScreen();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return FutureBuilder(
                future: Future.delayed(
                  const Duration(
                    seconds: 3,
                  ),
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Obx(
                      () => GetMaterialApp(
                        title: "Flutter Chat",
                        initialRoute: authC.isSkipIntro.isTrue
                            ? authC.isAuth.isTrue
                                ? Routes.HOME
                                : Routes.LOGIN
                            : Routes.INTRODUCTION,
                        getPages: AppPages.routes,
                      ),
                    );
                  } else {
                    return const SplashScreen();
                  }
                });
          }

          return const LoadingScreen();
        });
  }
}
