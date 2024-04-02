import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_app/Theme/Theme.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.changeTheme(
            Get.isDarkMode ? CustomTheme.lightMode : CustomTheme.darkMode);
      },
      child: Icon(
        Get.isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
