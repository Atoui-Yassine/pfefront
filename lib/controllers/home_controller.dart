import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_slider/widget_slider.dart';

class HomeController extends GetxController {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final controller = SliderController(
    duration: const Duration(milliseconds: 600),
  );
}
