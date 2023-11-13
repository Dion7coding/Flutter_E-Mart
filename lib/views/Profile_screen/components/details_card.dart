import 'package:emart_app/consts/consts.dart';

Widget DetailsCard({width,String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      title!.text.fontFamily(bold).color(blackColor).size(16).make(),
      5.heightBox,
      count!.text.color(blackColor).make()
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
