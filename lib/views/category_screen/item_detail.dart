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
                    return Image.asset(imgFc5,
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
                    Column(),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.message_rounded,color: darkFontGrey,),
                    )
                  ],
                ).box.height(70).color(textfieldGrey).make()
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
