import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/Controller/Image_controller.dart';
import 'package:new_app/Controller/firebase/Firebase_services.dart';
import 'package:new_app/Theme/Theme.dart';
import 'package:new_app/View/Dowenloder.dart';
import 'package:new_app/View/home_page.dart';
import 'package:new_app/model/dependency_unjection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Myapp());
  DependencyInjection.init();
}

class Myapp extends StatelessWidget {
  static final ImageController imagecontroller = Get.put(ImageController());
  static final FirebaseService fireBaseServices = Get.put(FirebaseService());
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightMode,
      darkTheme: CustomTheme.darkMode,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: () => Homepage()),
        GetPage(name: "/download", page: () => DownloadPage())
      ],
    );
  }
}
