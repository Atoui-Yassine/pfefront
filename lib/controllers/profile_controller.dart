import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html' as html;
import 'dart:html';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:pfefront/core/networking/app_api.dart';
import 'package:pfefront/screens/home/proposition_financement_screen.dart';

class ProfileController extends GetxController {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  GlobalKey<FormState> keyFormForgot = GlobalKey<FormState>();

  GlobalKey<FormState> keyFormVeify = GlobalKey<FormState>();
  GlobalKey<FormState> keyFormNewP = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController codePostaleController = TextEditingController();

  TextEditingController? passworsController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? confirmPassworsController = TextEditingController();

  bool isVisible = true;
  void showPassword() {
    isVisible = !isVisible;
    update(); // refrsh l page
  }

  bool isVisibleConfirmPwd = true;
  void showConfirmPwd() {
    isVisibleConfirmPwd = !isVisibleConfirmPwd;
    update(); // refrsh l page
  }

  bool visibility = true;
  String? selectedValue;
  String? selectedValueCivilityTitle = "civility";
  String selectedValueCountry = "country";

  List<String> listRole = ["Vendeur", "Client"];
  String? tempPath;
  List<File> images = [];
  XFile? image;
  html.File? pickedFile;
  Uint8List? fileBytes;
  void selectCountry(String country) {
    selectedValueCountry = country;
    update();
  }

  void onChnagedDropDownCivilityTitle(String? v) {
    selectedValueCivilityTitle = v;
    update();
  }

  void pickFile() {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        final reader = html.FileReader();
        reader.readAsArrayBuffer(files[0]);
        reader.onLoadEnd.listen((event) {
          pickedFile = files[0];
          print('file=========================$pickedFile');
          fileBytes = reader.result as Uint8List?;
          visibility = false;
          update();
        });
      }
    });
  }

  void onChnagedDropDown(String value) {
    selectedValue = value;
    update();
  }

  final dio = Dio();
  login() async {
    Map<String, dynamic> data = {
      "username": userNameController.text,
      "password": passworsController!.text
    };
    try {
      var response = await dio.post(AppApi.loginUrl, data: data);
      if (response.statusCode == 200) {
        print('login success');
        Get.to(const PropositionFinancementScreen());
      }
    } catch (e) {
      print('error================$e');
    }
  }
}
