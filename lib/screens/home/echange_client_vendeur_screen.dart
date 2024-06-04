import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flip_carousel/flip_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pfefront/controllers/home_controller.dart';
import 'package:pfefront/core/widgets/base_layout.dart';
import 'package:widget_slider/widget_slider.dart';

class EchangeClientVendeurScreen extends GetView<HomeController> {
  EchangeClientVendeurScreen({super.key});

  List<dynamic> cardItems = [
    Container(
      //  margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade50,
            offset: const Offset(0, 5),
            spreadRadius: 2,
            blurRadius: 8,
          ),
          // BoxShadow(
          //   color: Colors.grey.shade100,
          //   offset: const Offset(0, 5),
          //   spreadRadius: 2,
          //   blurRadius: 10,
          // ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "x2",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text.rich(
            TextSpan(
              text: "28/10/2024\t\t\t",
              children: [TextSpan(text: "         \t\t\t200 dt")],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text.rich(
            TextSpan(
              text: "28/10/2024\t\t\t",
              children: [TextSpan(text: "         \t\t\t200 dt")],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text.rich(
            TextSpan(
              text: "Total\t\t\t",
              children: [TextSpan(text: "         \t\t\t200 dt")],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 20)),
            onPressed: () {
              // if (controller.keyForm.currentState!.validate()) {
              //   print('form valide');
              // }
            },
            child: const Text(
              "Choisir",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ),
    Container(
      //  margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade50,
            offset: const Offset(0, 5),
            spreadRadius: 2,
            blurRadius: 8,
          ),
          // BoxShadow(
          //   color: Colors.grey.shade100,
          //   offset: const Offset(0, 5),
          //   spreadRadius: 2,
          //   blurRadius: 10,
          // ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "x3",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text.rich(
            TextSpan(
              text: "28/10/2024\t\t\t",
              children: [TextSpan(text: "         \t\t\t200 dt")],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text.rich(
            TextSpan(
              text: "28/10/2024\t\t\t",
              children: [TextSpan(text: "         \t\t\t200 dt")],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text.rich(
            TextSpan(
              text: "28/10/2024\t\t\t",
              children: [TextSpan(text: "         \t\t\t200 dt")],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text.rich(
            TextSpan(
              text: "Total\t\t\t",
              children: [TextSpan(text: "         \t\t\t200 dt")],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 20)),
            onPressed: () {
              // if (controller.keyForm.currentState!.validate()) {
              //   print('form valide');
              // }
            },
            child: const Text(
              "Choisir",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ),
    Container(
      //  margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade50,
            offset: const Offset(0, 5),
            spreadRadius: 2,
            blurRadius: 8,
          ),
          // BoxShadow(
          //   color: Colors.grey.shade100,
          //   offset: const Offset(0, 5),
          //   spreadRadius: 2,
          //   blurRadius: 10,
          // ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "x4",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text.rich(
            TextSpan(
              text: "28/10/2024\t\t\t",
              children: [TextSpan(text: "         \t\t\t200 dt")],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text.rich(
            TextSpan(
              text: "28/10/2024\t\t\t",
              children: [TextSpan(text: "         \t\t\t200 dt")],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text.rich(
            TextSpan(
              text: "28/10/2024\t\t\t",
              children: [TextSpan(text: "         \t\t\t200 dt")],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text.rich(
            TextSpan(
              text: "28/10/2024\t\t\t",
              children: [TextSpan(text: "         \t\t\t200 dt")],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text.rich(
            TextSpan(
              text: "Total\t\t\t",
              children: [TextSpan(text: "         \t\t\t200 dt")],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 20)),
            onPressed: () {
              // if (controller.keyForm.currentState!.validate()) {
              //   print('form valide');
              // }
            },
            child: const Text(
              "Choisir",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Page d'échange client/vendeur",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
      widget: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: FlipCarousel(
            items: cardItems,
            transitionDuration: const Duration(milliseconds: 400),
            isAssetImage: false,
            border: Border.all(width: 5, color: const Color(0xFFFFFFFF)),
            width: 300,
            height: 400,
            borderRadius: BorderRadius.circular(30),
            //   fit: BoxFit.cover,
            perspectiveFactor: 0.002,
            layersGap: 30,
            arrowControllersColor: Colors.blue,
            onChange: (int pageIndex) {
              print(pageIndex);
            },
            onTap: () {
              print("tap");
            },
          ),
        ),
      ),
    );
  }
}
