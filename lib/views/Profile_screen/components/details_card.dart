import 'package:emart_app/consts/consts.dart';

Widget DetailsCard({width,String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(blackColor).size(16).make(),
      5.heightBox,
      title!.text.color(blackColor).make()
    ],
  )
      .box
      .white
      .rounded
      .width(width)
      .height(80)
      .padding(EdgeInsets.all(4))
      .make();
}
