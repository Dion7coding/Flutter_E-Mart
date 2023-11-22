// ignore_for_file: curly_braces_in_flow_control_structures, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/loading_indicator.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/widgets_common/home_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

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
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: lightGrey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: searchanything,
                      hintStyle: TextStyle(color: textfieldGrey),
                    ),
                  ),
                ),
              ),

              // Trending Products
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      'Trending',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    LottieBuilder.asset(
                      "assets/images/Animation - 1700543176416.json",
                      height: 35,
                    )
                  ],
                ),
              ),
              // Trending Product
              20.heightBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FireStoreServices.getTrendingProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: loadingIndicator());
                    } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return "No Trending Products".text.white.makeCentered();
                    }

                    var trendingData = snapshot.data!.docs;
                    return Row(
                      children: List.generate(
                        trendingData.length,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 10,
                              ),
                              child: Image.network(
                                trendingData[index]['p_imgs'][0],
                                height: 150,
                                width: 210,
                                fit: BoxFit.cover,
                              ),
                            ),
                            10.heightBox,
                            Padding(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 60,
                              ),
                              child: "${trendingData[index]['p_name']}"
                                  .text
                                  .fontFamily(bold)
                                  .make(),
                            ),
                            10.heightBox,
                            Padding(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 50,
                              ),
                              child: "${trendingData[index]['p_price']}"
                                  .numCurrency
                                  .text
                                  .color(blackColor)
                                  .fontFamily(bold)
                                  .make(),
                            )
                          ],
                        )
                            .box
                            .gray100
                            .margin(EdgeInsets.symmetric(horizontal: 10))
                            .rounded
                            .padding(EdgeInsets.all(10))
                            .make(),
                      ),
                    );
                  },
                ),
              ),

              30.heightBox,
              
              // Limited Edition Products
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      'Limited- Edition',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    LottieBuilder.asset(
                      "assets/images/Ic0W30VJY6.json",
                      height: 50,
                    )
                  ],
                ),
              ),
              // Featured Product
              20.heightBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FireStoreServices.getLimitedProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: loadingIndicator());
                    } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return "No Limited edition Products"
                          .text
                          .white
                          .makeCentered();
                    }

                    var limitedData = snapshot.data!.docs;
                    return Row(
                      children: List.generate(
                        limitedData.length,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 10,
                              ),
                              child: Image.network(
                                limitedData[index]['p_imgs'][0],
                                height: 150,
                                width: 210,
                                fit: BoxFit.cover,
                              ),
                            ),
                            10.heightBox,
                            Padding(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 60,
                              ),
                              child: "${limitedData[index]['p_name']}"
                                  .text
                                  .fontFamily(bold)
                                  .make(),
                            ),
                            10.heightBox,
                            Padding(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 50,
                              ),
                              child: "${limitedData[index]['p_price']}"
                                  .numCurrency
                                  .text
                                  .color(blackColor)
                                  .fontFamily(bold)
                                  .make(),
                            )
                          ],
                        )
                            .box
                            .gray100
                            .margin(EdgeInsets.symmetric(horizontal: 10))
                            .rounded
                            .padding(EdgeInsets.all(10))
                            .make(),
                      ),
                    );
                  },
                ),
              ),
              30.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
