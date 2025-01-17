import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/services.dart';

Widget exitDialog(context) {
  return Dialog(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
    "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
    const Divider(),
    10.heightBox,
    "Are you sure you want to exit?".text.size(16).color(darkFontGrey).make(),
    10.heightBox,
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ourButton(
            color: blackColor,
            onPress: () {
              SystemNavigator.pop();
            },
            textColor: whiteColor,
            title: "Yes"),
        ourButton(
            color: blackColor,
            onPress: () {
              Navigator.pop(context);
            },
            textColor: whiteColor,
            title: "No")
      ],
    )
  ]).box.color(whiteColor).padding(EdgeInsets.all(12)).rounded.make());
}
