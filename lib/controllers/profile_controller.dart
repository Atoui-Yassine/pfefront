import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool isVisible = true;
  void showPassword() {
    isVisible = !isVisible;
    update(); // refrsh l page 
  }
}
