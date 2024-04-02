import 'package:get/get.dart';

class AfterBeforeController extends GetxController {
  RxDouble _value = 0.5.obs;

  double get value => _value.value;

  set value(double newValue) {
    _value.value = newValue;
  }

  void increaseValue(double amount) {
    _value.value += amount;
  }

  void Changevalue(double value) {
    _value.value = value;
  }

  void decreaseValue(double amount) {
    _value.value -= amount;
  }

  // Observable for loading state
  RxBool _isLoading = false.obs;

  // Getter for loading state
  bool get isLoading => _isLoading.value;

  // Setter for loading state
  set isLoading(bool value) => _isLoading.value = value;

  // Method to change loading state
  void changeIsLoading() {
    _isLoading.value = !_isLoading.value;
  }
}
