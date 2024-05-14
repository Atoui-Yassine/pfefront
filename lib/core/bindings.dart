import 'package:get/get.dart';
import 'package:pfefront/controllers/profile_controller.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
