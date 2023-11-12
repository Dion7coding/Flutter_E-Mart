import 'package:emart_app/consts/consts.dart';

Widget ourButton({onPress,color,textColor,title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, padding: EdgeInsets.all(15)),
      onPressed: () {
        onPress;
      },
      child: title.text.color(textColor).fontFamily(bold).make());
}
