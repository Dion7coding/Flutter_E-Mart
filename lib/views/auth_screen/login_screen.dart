import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/views/auth_screen/forgot_password.dart';
import 'package:emart_app/views/auth_screen/signup_screen.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/views/home_screen/home_screen.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/exit_dialog.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return WillPopScope(
      onWillPop: () async {
         showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => exitDialog(context),
        );
        return false;
      },
      child: bgWidget(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              20.heightBox,
              "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
              40.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTextField(
                        hint: emailHint,
                        title: email,
                        isPass: false,
                        controller: controller.emailControllers),
                    customTextField(
                        hint: passwordHint,
                        title: password,
                        isPass: true,
                        controller: controller.passwordControllers),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                               Get.to(() => forgotPassword());
                            }, child: forgetPass.text.make())),
                    5.heightBox,
                    //Login Button
                    controller.isLoading.value
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : ourButton(
                            color: blackColor,
                            title: login,
                            textColor: whiteColor,
                            onPress: () async {
                              controller.isLoading(true);
                              await controller
                                  .loginMethod(context: context)
                                  .then((value) {
                                if (value != null) {
                                  VxToast.show(context, msg: loggedin);
                                  Get.offAll(() => Home());
                                } else {
                                  controller.isLoading(false);
                                }
                              });
                            }).box.width(context.screenWidth - 120).make(),
    
                    5.heightBox,
                    createNewAccount.text.color(fontGrey).make(),
                    //sign-Up Button
                    5.heightBox,
                    ourButton(
                        color: blackColor,
                        title: signup,
                        textColor: whiteColor,
                        onPress: () {
                          Get.to(() => Signup());
                        }).box.width(context.screenWidth - 120).make(),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
              )
            ],
          ),
        ),
      )),
    );
  }
}
