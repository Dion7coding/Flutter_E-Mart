import 'package:emart_app/consts/consts.dart';

Widget customTextField({String? title, String? hint,TextEditingController? controller,isPass}) {
  return Column(
    crossAxisAlignment:CrossAxisAlignment.start ,
    children: [
      15.heightBox,
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: title!.text.color(blackColor).fontFamily(semibold).size(16).make(),
      ),
      5.heightBox,
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          obscureText: isPass,
          controller: controller,
          decoration:  InputDecoration(
            hintStyle: TextStyle(
              fontFamily: semibold,color: textfieldGrey
            ),
            hintText: hint,
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(borderSide:BorderSide(
              color: blackColor
            ) )
          ),
        ),
      ),
    ],
  );
}
