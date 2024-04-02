import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyMessage {
  static void RemarqueMessage(BuildContext context, String message) {
    Get.rawSnackbar(
        messageText: Text(
          message,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.background,
              fontSize: 14),
        ),
        isDismissible: false,
        duration: const Duration(seconds: 3),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        maxWidth: 400,
        icon: Icon(
          Icons.sync_problem,
          color: Theme.of(context).colorScheme.background,
          size: 35,
        ),
        margin: const EdgeInsets.all(8),
        snackStyle: SnackStyle.GROUNDED);
  }

  static void ErrorMessage(String message) {
    Get.rawSnackbar(
        messageText: Text(
          message,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
        ),
        isDismissible: false,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        maxWidth: 400,
        icon: const Icon(
          Icons.sync_problem,
          color: Colors.white,
          size: 35,
        ),
        margin: const EdgeInsets.all(8),
        snackStyle: SnackStyle.GROUNDED);
  }
}
