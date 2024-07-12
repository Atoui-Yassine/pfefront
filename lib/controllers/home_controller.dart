import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfefront/core/networking/app_api.dart';
import 'package:pfefront/screens/home/echange_client_vendeur_screen.dart';
import 'package:widget_slider/widget_slider.dart';
import 'package:intl/intl.dart';
import 'dart:html' as html;

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
        Get.to(EchangeClientVendeurScreen(
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

  html.File? pickedFile;
  Uint8List? fileBytes;
  List<String> listCarte = ["Carte Nationale d'Identité", "Passeport"];
  String? selectedValueMaritalStatus;
  void onChnagedDropDownMaritalStatus(String value) {
    selectedValueMaritalStatus = value;
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
          // visibility = false;
          update();
        });
      }
    });
  }

  html.File? pickedFileFace2;
  Uint8List? fileBytesFace2;
  void pickFileFace2() {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        final reader = html.FileReader();
        reader.readAsArrayBuffer(files[0]);
        reader.onLoadEnd.listen((event) {
          pickedFileFace2 = files[0];
          print('file=========================$pickedFileFace2');
          fileBytesFace2 = reader.result as Uint8List?;
          // visibility = false;
          update();
        });
      }
    });
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
}
