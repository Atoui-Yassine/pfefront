import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html' as html;
import 'dart:html';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:pfefront/core/networking/app_api.dart';
import 'package:pfefront/core/storage/app_storage.dart';
import 'package:pfefront/models/login_model.dart';
import 'package:pfefront/models/user_model.dart';
import 'package:pfefront/screens/home/proposition_financement_screen.dart';
import 'package:pfefront/screens/profile/edit_profile_screen.dart';
import 'package:pfefront/screens/profile/login_screen.dart';

class ProfileController extends GetxController {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  GlobalKey<FormState> keyFormForgot = GlobalKey<FormState>();
  GlobalKey<FormState> keyFormSignUp = GlobalKey<FormState>();

  GlobalKey<FormState> keyFormVeify = GlobalKey<FormState>();
  GlobalKey<FormState> keyFormNewP = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController codePostaleController = TextEditingController();

  TextEditingController? passworsController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController civiliteController = TextEditingController();
  TextEditingController nationnaliteController = TextEditingController();
  TextEditingController villeDeNaissanceController = TextEditingController();

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
  String? selectedValueCivilityTitle;
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

  void onChnagedDropDownCivilityTitle(String v) {
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
  LoginModel? loginModel;
  login() async {
    Map<String, dynamic> data = {
      "username": userNameController.text,
      "password": passworsController!.text
    };
    try {
      var response = await dio.post(AppApi.loginUrl, data: data);
      if (response.statusCode == 200) {
        print('login success');
        loginModel = LoginModel.fromJson(response.data);
        AppStorage.saveId(loginModel!.id);
        AppStorage.saveName(loginModel!.username);
        AppStorage.saveEmail(loginModel!.email!);
        Get.to(const PropositionFinancementScreen());
      }
    } catch (e) {
      print('error================$e');
    }
  }

  UserModel? userModel;
  getUser() async {
    try {
      var response = await dio.get(
        "${AppApi.getUserUrl}${AppStorage.readId()}",
      );
      if (response.statusCode == 200) {
        print('get success');
        userModel = UserModel.fromJson(response.data);
        userNameController.text = userModel!.username!;
        emailController.text = userModel!.email!;
        phoneController!.text = userModel!.phone!;
        nationnaliteController.text = userModel!.nationnalit!;
        villeDeNaissanceController.text = villeDeNaissanceController.text;
        selectedValueCountry = userModel!.paysdenaissance!;
        codePostaleController.text = userModel!.codepostaledenaissance!;
        selectedValueCivilityTitle = userModel!.civilit;
        Get.to(const EditProfileScreen());
      }
    } catch (e) {
      print('error================$e');
    }
  }

  signUp() async {
    Map<String, dynamic> data = {
      "username": userNameController.text,
      "email": emailController.text,
      "phone": phoneController!.text,
      "role": selectedValue,
      "password": passworsController!.text,
      "villedenaissance": villeDeNaissanceController.text,
      "codepostaledenaissance": codePostaleController.text,
      "paysdenaissance": selectedValueCountry,
      "nationnalité": nationnaliteController.text,
      "civilité": selectedValueCivilityTitle
    };
    dio_.FormData data_ = dio_.FormData.fromMap({
      "file": dio_.MultipartFile.fromBytes(
        fileBytes!,
        filename: pickedFile!.name,
      ),
    });
    try {
      var response =
          await dio.post(AppApi.signupUrl, queryParameters: data, data: data_);
      if (response.statusCode == 200) {
        print('signUp success---------------------');
        Get.to(const LoginScreen());
      }
    } catch (e) {
      print('error================$e');
    }
  }
}
