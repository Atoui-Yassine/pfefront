import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_;
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfefront/core/networking/app_api.dart';
import 'package:pfefront/core/storage/app_storage.dart';
import 'package:pfefront/models/contrat_model.dart';
import 'package:pfefront/screens/home/create_financement_screen.dart';
import 'package:widget_slider/widget_slider.dart';
import 'package:intl/intl.dart';
// import 'dart:html' as html;

class HomeController extends GetxController {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  GlobalKey<FormState> keyFormInscrip = GlobalKey<FormState>();

  TextEditingController montantTotaleController = TextEditingController();
  TextEditingController montantFinancierController = TextEditingController();
  TextEditingController apportPersonnelController = TextEditingController();
  String formattedDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());
  String d = DateTime.now().day.toString();
  int m = DateTime.now().month;
  int m1 = DateTime.now().month + 1;

  int m2 = DateTime.now().month + 2;
  int m3 = DateTime.now().month + 3;
  int m4 = DateTime.now().month + 4;

  String y = DateTime.now().year.toString();

  final controller = SliderController(
    duration: const Duration(milliseconds: 600),
  );
  final dio = Dio();
//------------------------------------image-------------------

  File? image; // Variable to hold the selected image
  final picker = ImagePicker(); // Image picker instance
//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    update(); // Update the UI to reflect the selected image
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    update(); // Update the UI to reflect the selected image
  }

  //Show options to get image from camera or gallery
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

//------------------------------------image-------------------

  createFinancement() async {
    Map<String, dynamic> data = {
      "montanttotal": montantFinancierController.text,
      "montantafinancer": montantTotaleController.text,
      "apportpersonnel": apportPersonnelController.text,
      "dateAchat": "${DateTime.now()}"
    };
    try {
      var response =
          await dio.post(AppApi.createFinancementUrl, queryParameters: data);
      if (response.statusCode == 200) {
        print('login success');
        int m = int.parse(apportPersonnelController.text.isNotEmpty
            ? montantFinancierController.text
            : montantTotaleController.text);
        Get.to(CreateFinancement(
            m,
            apportPersonnelController.text.isNotEmpty
                ? montantFinancierController.text
                : montantTotaleController.text));
      }
    } catch (e) {
      print('error================$e');
    }
  }

  updateMonatant(String v, String v2) {
    montantFinancierController.text =
        (double.parse(v) - double.parse(v2)).toString();
    update();
  }

  XFile? pickedFile;
  Uint8List? fileBytes;
  List<String> listCarte = ["Carte Nationale d'Identité", "Passeport"];
  String? selectedValueMaritalStatus;
  void onChnagedDropDownMaritalStatus(String value) {
    selectedValueMaritalStatus = value;
    update();
  }

  String? selectedValueCivilityTitle;
  List<String> civilityTitle = [
    "Ms",
    "Mrs.",
    "Mr.",
    "Miss.",
    "Not Specified",
    "Prefer Not to say"
  ];

  void onChnagedDropDownCivilityTitle(String v) {
    selectedValueCivilityTitle = v;
    update();
  }

  bool? checkBoxValue = false;
  bool isCheckedYes = false;
  bool isCheckedNo = false;

  void handleYesChecked(bool value) {
    if (value) {
      isCheckedYes = true;
      isCheckedNo = false; // Deselect 'No'
      update();
    } else {
      isCheckedYes = false;
      update();
    }
  }

  void handleNoChecked(bool value) {
    if (value) {
      isCheckedNo = true;
      isCheckedYes = false; // Deselect 'Yes'
      update();
    } else {
      isCheckedNo = false;
      update();
    }
  }

  TextEditingController countryControllerController = TextEditingController();
  @override
  void onInit() {
    countryControllerController.text = "country";
    super.onInit();
  }

  void selectCountry(String country) {
    countryControllerController.text = country;
    update();
  }

  ContratModel? contratModel;
  getContrat() async {
    try {
      var response =
          await dio.get("${AppApi.getContratUrl}${AppStorage.readId()}");
      if (response.statusCode == 200) {
        contratModel = ContratModel.fromJson(response.data);
        print("contrat model==========$contratModel");
        AppStorage.saveNumContrat(contratModel!.codecontrat);
      }
    } catch (e) {
      print("error=============$e");
    }
  }
}
