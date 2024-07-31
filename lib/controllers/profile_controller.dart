import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_;
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
//import 'dart:html' as html;
//import 'dart:html';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:pfefront/core/networking/app_api.dart';
import 'package:pfefront/core/storage/app_storage.dart';
import 'package:pfefront/models/login_model.dart';
import 'package:pfefront/models/user_model.dart';
import 'package:pfefront/screens/home/proposition_financement_screen.dart';
import 'package:pfefront/screens/profile/edit_profile_screen.dart';
import 'package:pfefront/screens/profile/login_screen.dart';
import 'package:pfefront/screens/profile/new_password_screen.dart';
import 'package:pfefront/screens/profile/verify_code_screen.dart';

class ProfileController extends GetxController {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  GlobalKey<FormState> keyFormCode = GlobalKey<FormState>();

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
  TextEditingController? photoController = TextEditingController();

  TextEditingController? phoneController = TextEditingController();
  TextEditingController countryControllerController = TextEditingController();

  TextEditingController? confirmPassworsController = TextEditingController();
  TextEditingController? newPassworsController = TextEditingController();
  TextEditingController code1Controller = TextEditingController();
  TextEditingController code2Controller = TextEditingController();
  TextEditingController code3Controller = TextEditingController();
  TextEditingController code4Controller = TextEditingController();
  TextEditingController code5Controller = TextEditingController();
  TextEditingController code6Controller = TextEditingController();
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

  List<String> listRole = ["Vendeur", "Client"];
  String? tempPath;

  Uint8List? fileBytes;
  @override
  void onInit() {
    countryControllerController.text = "country";
    super.onInit();
  }

  void selectCountry(String country) {
    countryControllerController.text = country;
    update();
  }

  void onChnagedDropDownCivilityTitle(String v) {
    selectedValueCivilityTitle = v;
    update();
  }

  // void pickFile() {
  //   html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  //   uploadInput.click();
  //   uploadInput.onChange.listen((event) {
  //     final files = uploadInput.files;
  //     if (files != null && files.isNotEmpty) {
  //       final reader = html.FileReader();
  //       reader.readAsArrayBuffer(files[0]);
  //       reader.onLoadEnd.listen((event) {
  //         pickedFile = files[0];
  //         print('file=========================$pickedFile');
  //         fileBytes = reader.result as Uint8List?;
  //         visibility = false;
  //         update();
  //       });
  //     }
  //   });
  // }

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
        print("id");
        AppStorage.saveId(loginModel!.id.toString());
        AppStorage.saveName(loginModel!.username);
        AppStorage.saveEmail(loginModel!.email!);
        AppStorage.saveToken(loginModel!.token!);
        getUser();
        emailController.text = '';
        passworsController!.text = '';
        Get.to(const PropositionFinancementScreen());
      }
    } catch (e) {
      print('error================$e');
    }
  }

  forgotPassword(BuildContext context) async {
    Map<String, dynamic> data = {
      "email": emailController.text,
    };
    try {
      var response =
          await dio.post(AppApi.forgetPasswordUrl, queryParameters: data);
      if (response.statusCode == 200) {
        print('forogt  success');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.grey[200],
            content: const Text(
              "s'il vous plait verifiez votre boîte de réception",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        );
        Get.to(const VerifyCodeScreen());
      }
    } catch (e) {
      print('error================$e');
    }
  }

  verifyCodePassword(BuildContext context) async {
    Map<String, dynamic> data = {
      "newpassword": newPassworsController!.text,
    };
    try {
      var response = await dio.post(
          "${AppApi.verifyCodePasswordUrl}${code1Controller.text}${code2Controller.text}${code3Controller.text}${code4Controller.text}${code5Controller.text}${code6Controller.text}",
          queryParameters: data);
      if (response.statusCode == 200) {
        print('verifyCodePasswordUrl  success');

        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     backgroundColor: Colors.grey[200],
        //     content: const Text(
        //       "s'il vous plait verifiez votre boîte de réception",
        //       style: TextStyle(color: Colors.blue),
        //     ),
        //   ),
        // );
        Get.to(const LoginScreen());
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
        villeDeNaissanceController.text = userModel!.villedenaissance!;
        countryControllerController.text = userModel!.paysdenaissance!;
        codePostaleController.text = userModel!.codepostaledenaissance!;
        print("***********");
        selectedValueCivilityTitle = userModel!.civilit;
        photoController!.text = userModel!.photo!;
      }
    } catch (e) {
      print('error================$e');
    }
  }

  signUp() async {
    // userNameController.text = "";
    // emailController.text = "";
    // phoneController!.text = "";
    // nationnaliteController.text = "";
    // villeDeNaissanceController.text = "";
    // countryControllerController.text = "";
    // codePostaleController.text = "";
    // print("***********");
    // selectedValueCivilityTitle = "";
    // photoController!.text = "";
    print('image=============$image===============path${image!.path}');
    Map<String, dynamic> data = {
      "username": userNameController.text,
      "email": emailController.text,
      "phone": phoneController!.text,
      "role": selectedValue,
      "password": passworsController!.text,
      "villedenaissance": villeDeNaissanceController.text,
      "codepostaledenaissance": codePostaleController.text,
      "paysdenaissance": countryControllerController.text,
      "nationnalité": nationnaliteController.text,
      "civilité": selectedValueCivilityTitle
    };
    dio_.FormData data_ = dio_.FormData.fromMap({
      "file": await dio_.MultipartFile.fromFile(
        image!.path,
        filename: image!.uri.pathSegments.last,
        //   filename: pickedFile!.name,
      ),
    });
    try {
      print('data signup=============${data}');
      var response =
          await dio.post(AppApi.signupUrl, queryParameters: data, data: data_);
      if (response.statusCode == 200) {
        print('signUp success---------------------');
        Get.to(const LoginScreen());
      }
    } catch (e) {
      print('errorsingup================$e');
    }
  }

  updateUser() async {
    print("update user**** ");
    Map<String, dynamic> data = {
      "username": userNameController.text,
      "email": emailController.text,
      "phone": phoneController!.text,
      // "role": selectedValue,
      // "password": passworsController!.text,
      "villedenaissance": villeDeNaissanceController.text,
      "codepostaledenaissance": codePostaleController.text,
      "paysdenaissance": countryControllerController.text,
      "nationnalité": nationnaliteController.text,
      "civilité": selectedValueCivilityTitle
    };
    dio_.FormData data_ = dio_.FormData.fromMap({
      // "file": pickedFile != null && fileBytes != null
      //     ? dio_.MultipartFile.fromBytes(
      //         fileBytes!,
      //         filename: pickedFile!.name,
      //       )
      //     : dio_.MultipartFile.fromString(
      //         photoController!.text,
      //         //  filename: pickedFile!.name,
      //       ),
    });
    try {
      var response = await dio.put(
          "${AppApi.updateUserUrl}${AppStorage.readId()}",
          queryParameters: data,
          data: data_);
      if (response.statusCode == 200) {
        print('update success---------------------');
        //  Get.to(const LoginScreen());
      }
    } catch (e) {
      print('error================$e');
    }
  }

  //logout
  Future<void> logOut() async {
    String? accessToken = AppStorage.readToken();
    print('Access Token ==> $accessToken');

    if (accessToken != null) {
      Dio dio = Dio();
      Options options = Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      try {
        await dio.get(
          AppApi.logOutUrl,
          options: options,
        );

        // AppStorage.clearUserData();
        Get.to(const LoginScreen());
        print('Déconnexion réussie');
      } catch (error) {
        print('Erreur lors de la déconnexion: $error');
      }
    } else {
      print('Token d\'accès introuvable');
    }
  }
  //------------------------------------image-------------------

  File? image;
  File? imageFace2;
  final picker = ImagePicker(); // Image picker instance
//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      print('image2============>${image!.path}');
      visibility = false;
    }
    update(); // Update the UI to reflect the selected image
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      print('image2============>${image!.path}');
      visibility = false;
    }
    update(); // Update the UI to reflect the selected image
  }

  Future showOptions(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }
}
