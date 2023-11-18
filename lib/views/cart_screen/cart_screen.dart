// ignore_for_file: sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/loading_indicator.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: "Shopping Cart"
                .text
                .color(whiteColor)
                .fontFamily(semibold)
                .make()),
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
                    child: "Cart is empty".text.color(blackColor).make());
              } else {
                var data = snapshot.data!.docs;
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
                              leading: Image.network('${data[index]['img']}'),
                              title: "${data[index]['title']}"
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
                                  trailing: Icon(Icons.delete,color: Colors.black,),
                            );
                          },
                        ),
                        color: Colors.white,
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Total Price"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          "40"
                              .numCurrency
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make()
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
                            onPress: () {},
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
