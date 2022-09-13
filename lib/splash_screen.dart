// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(
          height: 60,
          child: Image.asset("assets/starplayers.png"),
        ),
        ]
        ),
      ),
    );
  }
}
