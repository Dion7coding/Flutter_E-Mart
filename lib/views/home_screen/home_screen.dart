import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/home_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                  children: [
            //search Bar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: lightGrey,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: searchanything,
                      hintStyle: TextStyle(color: textfieldGrey)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children:  [
                  Text(
                    'Trending',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  
                  Image.asset(fire, height: context.screenHeight * 0.03),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ]
              ),
            ),
            //Featured Product
            20.heightBox,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    6,
                    (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              psg_nike,
                              width: 200,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                            10.heightBox,
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: "PSG Shoe - Nike".text.fontFamily(bold).make(),
                            ),
                            10.heightBox,
                            Padding(
                              padding: const EdgeInsets.only(left: 75),
                              child: "\$100".text.color(blackColor).fontFamily(bold).make(),
                            )
                          ],
                        )
                            .box
                            .gray100
                            .margin(EdgeInsets.symmetric(horizontal: 10))
                            .rounded
                            .padding(EdgeInsets.all(10))
                            .make()),
              ),
            ),
            30.heightBox,
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    2,
                    (index) => homeButton(
                        height: context.screenHeight * 0.2,
                        width: context.screenWidth / 2.5,
                        icon:index==0? icTodaysDeal:icFlashDeal,
                        title: index==0? todayDeal:flashsale)))
                  ],
                ),
          )),
    );
  }
}
