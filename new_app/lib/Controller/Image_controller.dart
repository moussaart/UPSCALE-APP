import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:new_app/class/message_class.dart';

class ImageController extends GetxController {
  final RxString _image = "asset/vide.png".obs;

  // Getter for the _image variable
  String get image => _image.value;

  // Setter for the _image variable
  set image(String value) => _image.value = value;

  // Toggler method to switch between two values
  void changeImage(String newImage) {
    _image.value = newImage;
  }

  final RxString _name = "name".obs;

  // Getter for the _name variable
  String get name => _name.value;

  // Setter for the _name variable
  set name(String value) => _name.value = value;

  // Toggler method to switch between two values
  void changename(String newImage) {
    _name.value = newImage;
  }

  Future<void> PickImageFromGalleryPhone(
      ImageController _imagecontroller) async {
    print("Phone==================");
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image, // Restrict to images
        allowMultiple: true, // Allow only one file to be picked
      );
      if (result != null && result.files.isNotEmpty) {
        String? imagePath = result.files.first.path;

        // Use the image path as needed, for example, display it in an Image widget
        _imagecontroller.changeImage(imagePath!);
        _imagecontroller.changename(result.files.first.name);
      } else {
        // User canceled the picker
        MyMessage.ErrorMessage('No image selected.');
      }
    } catch (e) {
      // Handle any errors
      MyMessage.ErrorMessage('TRY AGAIN PLEASE');
    }
  }
}
