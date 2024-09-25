import 'dart:io';
import 'dart:io' as io; // Import dart:io for mobile platforms (Android/iOS)

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
//import 'dart:html' as html;
//import 'dart:html';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:pfefront/controllers/home_controller.dart';
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
  io.File? image;
  Uint8List? fileBytes;
  File? image2;
  File? imageFace2;
  Uint8List? imageBytes;
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
        await startProcess("Process_7607");
      }
    } catch (e) {
      print('error================$e');
    }
  }
startProcess(String processKey) async {
  String startUrl = "${AppApi.baseUrl}api/process/start/$processKey";

  try {
    var response = await dio.post(startUrl, data: {});

    if (response.statusCode == 200) {
      print("Process: ${response.data}");
      var processInstanceId = response.data;

      print("Process started successfully with ID: $processInstanceId");

      AppStorage.saveProcessInstanceId(processInstanceId);
    }
  } catch (e) {
    print('Error starting process: $e');
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
    
    // print('image=============$image2===============path${image2!.path}');
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
   dio_.FormData formData = dio_.FormData();

  // Ajouter le fichier s'il existe
  if (image != null) { // Pour les plateformes mobiles
    formData.files.add(MapEntry(
      "file",
      await dio_.MultipartFile.fromFile(
        image!.path,
        filename: image!.uri.pathSegments.last,
      ),
    ));
  } else if (imageBytes != null) { // Pour le web (où l'image est stockée sous forme d'octets)
    formData.files.add(MapEntry(
      "file",
      dio_.MultipartFile.fromBytes(
        imageBytes!,
        filename: 'image_uploaded.png', // Nom par défaut pour l'image sur le web
      ),
    ));
  }

  // Debug : Afficher le contenu des données
  print('Données JSON : $data');
  print('Fichiers dans FormData : ${formData.files.map((f) => f.value.filename).toList()}');

    try {
      print('data signup=============${data}');
      var response =
          await dio.post(AppApi.signupUrl, queryParameters: data, data: formData);
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
      "file": image != null
          ? await dio_.MultipartFile.fromFile(
              image!.path,
              filename: image!.uri.pathSegments.last,
            )
          : dio_.MultipartFile.fromString(
              photoController!.text,
              filename: image!.uri.pathSegments.last,
            ),
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
        this.killProcess();
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
  Future<void> killProcess() async {
  try {
    String?  processInstanceId =AppStorage.readProcessInstanceId();
    String url = "${AppApi.baseUrl}api/process/kill/$processInstanceId";

    var response = await Dio().delete(url);

    if (response.statusCode == 200) {
      print("Process with ID $processInstanceId killed successfully.");
    } else {
      print("Failed to kill process. Status code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error killing process: $e");
  }
}
  //------------------------------------image-------------------

  final picker = ImagePicker(); // Image picker instance
//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    if (kIsWeb) {
      // Handle image picking for web
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageBytes =
            await pickedFile.readAsBytes(); // Read image as bytes for web
        visibility = false;
        update(); // Update UI after picking image
      }
    } else {
      // Handle image picking for mobile
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image2 = io.File(pickedFile.path); // Load image as File for mobile
        visibility = false;
        update(); // Update UI after picking image
      }
    } // Update the UI to reflect the selected image
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    if (kIsWeb) {
      // Currently, web support for camera access is limited
      print("Camera access is not fully supported on web");
    } else {
      // Handle image picking from camera for mobile
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        image = io.File(pickedFile.path); // Load image as File for mobile
        visibility = false;
        update(); // Update UI after picking image
      }
    } // Update the UI to reflect the selected image
  }

  Future showOptions(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              Navigator.of(context).pop(); // Close modal
              getImageFromGallery(); // Pick image from gallery
            },
          ),
          if (!kIsWeb) // Camera is only supported on mobile platforms
            CupertinoActionSheetAction(
              child: const Text('Camera'),
              onPressed: () {
                Navigator.of(context).pop(); // Close modal
                getImageFromCamera(); // Pick image from camera
              },
            ),
        ],
      ),
    );
  }
}
