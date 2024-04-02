import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// Service class for Firebase-related operations
class FirebaseService extends GetxController {
  // Observable for the current image URL
  RxString _imageURL = "asset/vide.png".obs;

  // Getter for the image URL
  String get imageURL => _imageURL.value;

  // Setter for the image URL
  set imageURL(String value) => _imageURL.value = value;

  // Method to change the image URL
  void changeImageURL(String newImage) {
    _imageURL.value = newImage;
  }

  // Observable for loading state
  RxBool _isLoading = false.obs;

  // Getter for loading state
  bool get isLoading => _isLoading.value;

  // Setter for loading state
  set isLoading(bool value) => _isLoading.value = value;

  // Method to change loading state
  void changeIsLoading(bool newValue) {
    _isLoading.value = newValue;
  }

  // Static method to upload a file to Firebase Storage
  static Future<void> uploadFile(
      String name, File file, FirebaseService firebaseService) async {
    String path = 'files/${name}';

    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);

    var snapshot = await uploadTask!.whenComplete(() => null);

    firebaseService.changeImageURL(await snapshot.ref.getDownloadURL());
  }

  // Static method to delete a file from Firebase Storage
  static Future<void> deleteFile(
      String url, FirebaseService firebaseService) async {
    await FirebaseStorage.instance.ref().child(url).delete();
    firebaseService.changeImageURL("asset/vide.png");
  }
}
