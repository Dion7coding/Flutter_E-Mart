import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.edit,
                  color: whiteColor,
                ),
              ),
              //users details section
              Row(
                children: [
                  Icon(
                    Icons.person_2_outlined,
                    color: Colors.white,
                    size: 50,
                  ).box.make(),
                  10.widthBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy User".text.fontFamily(semibold).white.make(),
                      "customer@example.com"
                          .text
                          .fontFamily(semibold)
                          .white
                          .make()
                    ],
                  )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: whiteColor)),
                      onPressed: () {},
                      child: "Logout".text.fontFamily(semibold).white.make())
                ],
              ),
              20.heightBox,
              
            ],
          ),
        ),
      ),
    );
  }
}
