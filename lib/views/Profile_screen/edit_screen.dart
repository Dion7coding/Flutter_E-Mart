import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.person_2_outlined,
            color: Colors.black,
            size: 50,
          ).box.make(),
          10.heightBox,
          Divider(),
          20.heightBox,
          customTextField(hint: NameHint, title: Name, isPass: false),
          customTextField(hint: passwordHint, title: password, isPass: true),
          20.heightBox,
          SizedBox(
            width: context.screenWidth-60,
              child: ourButton(
                  color: blackColor,
                  onPress: () {},
                  textColor: whiteColor,
                  title: "Save"))
        ],
      )
          .box
          .white
          .padding(EdgeInsets.all(16))
          .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
          .rounded
          .make(),
    );
  }
}
