import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controller/product_controller.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({super.key, required this.title,this.data});

  @override
  Widget build(BuildContext context) {
    Get.put<ProductController>(ProductController());
    var controller = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: title!.text.color(whiteColor).fontFamily(bold).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //swiper Section
                VxSwiper.builder(
                  autoPlay: true,
                  height: 350,
                  itemCount: data['p_imgs'].length,
                  aspectRatio: 16 / 9,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(23.0),
                      child: Image.network(data['p_imgs'][index],
                          width: double.infinity, fit: BoxFit.cover),
                    );
                  },
                ),
                10.heightBox,
                //title and details section
                title!.text
                    .size(16)
                    .color(darkFontGrey)
                    .fontFamily(bold)
                    .make(),
                10.heightBox,
                //rating
                VxRating(
                  isSelectable: false,
                  value: double.parse(data['p_rating']),
                  onRatingUpdate: (value) {},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  size: 25,
                  stepInt: true,
                  maxRating: 5,
                ),

                10.heightBox,
                "${data['p_price']}".numCurrency
                    .text
                    .color(blackColor)
                    .fontFamily(bold)
                    .size(18)
                    .make(),

                10.heightBox,
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Seller".text.white.fontFamily(semibold).make(),
                        5.heightBox,
                        "${data['p_seller']}"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .size(16)
                            .make()
                      ],
                    )),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.message_rounded,
                        color: darkFontGrey,
                      ),
                    )
                  ],
                )
                    .box
                    .height(60)
                    .padding(EdgeInsets.symmetric(horizontal: 16))
                    .color(textfieldGrey)
                    .make(),
                //color section
                Column(
                  children: [
                    //quantity row
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Quantity: ".text.color(blackColor).make(),
                        ),
                        Obx(
                          ()=> Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.decreaseQuantity();
                                  }, icon: Icon(Icons.remove)),
                              controller.quantity.value
                                  .text
                                  .size(16)
                                  .color(darkFontGrey)
                                  .fontFamily(bold)
                                  .make(),
                              IconButton(
                                  onPressed: () {
                                    controller.increaseQuantity(
                                      int.parse(data['p_quantity'])
                                    );
                                  }, icon: const Icon(Icons.add)),
                              10.widthBox,
                              "${data['p_quantity']} available".text.color(blackColor).make(),
                            ],
                          ),
                        ),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),
                    //Total Row
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Total: ".text.color(blackColor).make(),
                        ),
                        "\$0.00"
                            .text
                            .color(redColor)
                            .size(16)
                            .fontFamily(bold)
                            .make()
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),
                  ],
                ).box.white.shadowSm.make(),
                //description section
                10.heightBox,
                "Description"
                    .text
                    .color(darkFontGrey)
                    .fontFamily(semibold)
                    .make(),
                10.heightBox,
                "${data['p_desc']}"
                    .text
                    .color(darkFontGrey)
                    .make(),
                //button section
                ListView(
                  shrinkWrap: true,
                  children: List.generate(
                      itemdetailsButtonList.length,
                      (index) => ListTile(
                            title: "${itemdetailsButtonList[index]}"
                                .text
                                .semiBold
                                .color(darkFontGrey)
                                .make(),
                            trailing: Icon(Icons.arrow_forward),
                          )),
                )
              ],
            )),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
                color: redColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Add to cart"),
          )
        ],
      ),
    );
  }
}
