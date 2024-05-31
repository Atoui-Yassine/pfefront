import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Widget widget;
  final PreferredSizeWidget? appBar;

  const BaseLayout({super.key, required this.widget, this.appBar});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.5,
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: widget /* add child content here */,
        ),
      ),
    );
  }
}
