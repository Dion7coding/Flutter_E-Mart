import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class Payment_Success extends StatefulWidget {
  const Payment_Success({super.key});

  @override
  State<Payment_Success> createState() => _Payment_SuccessState();
}

class _Payment_SuccessState extends State<Payment_Success> {

  changeScreen() {
    Future.delayed(Duration(seconds: 4), () {
      //using getx
      //Get.to(() => const LoginScreen());
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => LoginScreen());
        } else {
          Get.to(() => Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: LottieBuilder.asset(
                  "assets/images/Animation - 1700559982123.json")),
        
          Container(
            child: Text(
              "Order Placed !",
              style: TextStyle(color: Colors.white,fontSize: 40),
            ),
          )
        ],
      ),
    );
  }
}
