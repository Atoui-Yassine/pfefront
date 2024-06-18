import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfefront/core/networking/app_api.dart';
import 'package:pfefront/screens/home/echange_client_vendeur_screen.dart';
import 'package:widget_slider/widget_slider.dart';

class HomeController extends GetxController {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController montantTotaleController = TextEditingController();
  TextEditingController montantFinancierController = TextEditingController();
  TextEditingController apportPersonnelController = TextEditingController();
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
        Get.to(EchangeClientVendeurScreen());
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
