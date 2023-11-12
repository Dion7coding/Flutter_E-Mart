import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool? isCheck = false;

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            20.heightBox,
            "Join the  $appname".text.fontFamily(bold).white.size(18).make(),
            40.heightBox,
            Column(
              children: [
                customTextField(hint: NameHint, title: Name),
                customTextField(hint: emailHint, title: email),
                customTextField(hint: passwordHint, title: password),
                customTextField(hint: passwordHint, title: retypePassword),
                Row(
                  children: [
                    //Checkbox
                    Checkbox(
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        }),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I agree to the ",
                            style:
                                TextStyle(fontFamily: bold, color: fontGrey)),
                        TextSpan(
                            text: termsAndConditions,
                            style:
                                TextStyle(fontFamily: bold, color: blackColor)),
                        TextSpan(
                            text: "&",
                            style:
                                TextStyle(fontFamily: bold, color: fontGrey)),
                        TextSpan(
                            text: PrivacyPolicy,
                            style:
                                TextStyle(fontFamily: bold, color: blackColor)),
                      ])),
                    )
                  ],
                ),
                5.heightBox,
                ourButton(
                        color: isCheck==true? blackColor :lightGrey,
                        title: signup,
                        textColor: whiteColor,
                        onPress: () {})
                    .box
                    .width(context.screenWidth - 120)
                    .make(),
                10.heightBox,
                //Wapping into gesture detector of velocity x
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: alreadyHaveAccount,
                      style: TextStyle(fontFamily: bold, color: fontGrey)),
                  TextSpan(
                      text: login,
                      style: TextStyle(fontFamily: bold, color: blackColor)),
                ])).onTap(() {
                  Get.back();
                })
              ],
            )
                .box
                .white
                .rounded
                .padding(EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make()
          ],
        ),
      ),
    ));
  }
}