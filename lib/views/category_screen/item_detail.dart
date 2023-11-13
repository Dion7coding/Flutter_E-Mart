import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String? title;

  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
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
                  itemCount: 3,
                  aspectRatio: 16 / 9,
                  itemBuilder: (context, index) {
                    return Image.asset(psg_nike,
                        width: double.infinity, fit: BoxFit.cover);
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
                  onRatingUpdate: (value) {},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  size: 25,
                  stepInt: true,
                ),

                10.heightBox,
                "\$30,000"
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
                        "In House Brands"
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
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color: ".text.color(textfieldGrey).make(),
                        ),
                        Row(
                          children: List.generate(
                              3,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(Vx.randomPrimaryColor)
                                  .margin(EdgeInsets.symmetric(horizontal: 4))
                                  .make()),
                        )
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),

                    //quantity row
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color: ".text.color(textfieldGrey).make(),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.remove)),
                            "0"
                                .text
                                .size(16)
                                .color(darkFontGrey)
                                .fontFamily(bold)
                                .make(),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.add)),
                            10.widthBox,
                            "(0 available)".text.color(textfieldGrey).make(),
                            
                          ],
                        ),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),
                    //Total Row
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Total: ".text.color(textfieldGrey).make(),
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
                "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                10.heightBox,
                "This is a dummy item and dummy description here...".text.color(darkFontGrey).make()
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
