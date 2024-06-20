import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfefront/core/networking/app_api.dart';
import 'package:pfefront/screens/home/echange_client_vendeur_screen.dart';
import 'package:widget_slider/widget_slider.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController montantTotaleController = TextEditingController();
  TextEditingController montantFinancierController = TextEditingController();
  TextEditingController apportPersonnelController = TextEditingController();
  String formattedDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());
  String d = DateTime.now().day.toString();
  int m = DateTime.now().month + 1;
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
        Get.to( EchangeClientVendeurScreen(m));
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
}
