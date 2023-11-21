// ignore_for_file: sort_child_properties_last, prefer_typing_uninitialized_variables

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/loading_indicator.dart';
import 'package:emart_app/controller/cart_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/cart_screen/shipping.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
        ),
        body: StreamBuilder(
            stream: FireStoreServices.getCart(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: LottieBuilder.asset("assets/images/zNgR3USMxu.json")),
                              10.heightBox,
                      Center(
                          child:
                              "Cart is empty !".text.color(whiteColor).make()),
                    ],
                  ),
                );
              } else {
                var data = snapshot.data!.docs;
                controller.calculate(data);
                controller.productSnapshot = data;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Image.network('${data[index]['img']}',
                              width: 120,
                              fit: BoxFit.cover,
                              ),
                              title:
                                  "${data[index]['title']} (x ${data[index]['qty']})"
                                      .text
                                      .fontFamily(semibold)
                                      .size(16)
                                      .make(),
                              subtitle: "${data[index]['tprice']}"
                                  .numCurrency
                                  .text
                                  .fontFamily(semibold)
                                  .size(16)
                                  .make(),
                              trailing: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ).onTap(() {
                                FireStoreServices.deleteDocument(
                                    data[index].id);
                              }),
                            );
                          },
                        ),
                        color: Colors.white,
                      )),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Total Price"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          Obx(
                            () => "${controller.totalP.value}"
                                .numCurrency
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          )
                        ],
                      )
                          .box
                          .padding(EdgeInsets.all(20))
                          .color(Colors.white)
                          .width(context.screenWidth - 60)
                          .roundedSM
                          .make(),
                      10.heightBox,
                      SizedBox(
                        child: ourButton(
                            color: darkFontGrey,
                            onPress: () {
                              Get.to(() => const ShippingDetails());
                            },
                            textColor: whiteColor,
                            title: "Proceed to Shipping"),
                        width: context.screenWidth - 60,
                      ),
                      10.heightBox
                    ],
                  ),
                );
              }
            }));
  }
}
