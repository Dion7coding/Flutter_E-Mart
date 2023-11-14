import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/profile_controller.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.nameController.text = data['name'];
    controller.passController.text = data['password'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Obx(
        () => Column(
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
            customTextField(
                controller: controller.nameController,
                hint: NameHint,
                title: Name,
                isPass: false),
            customTextField(
                controller: controller.passController,
                hint: passwordHint,
                title: password,
                isPass: true),
            20.heightBox,
            controller.isloading.value
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  )
                : SizedBox(
                    width: context.screenWidth - 60,
                    child: ourButton(
                      color: blackColor,
                      onPress: () async {
                        await controller.updateProfile(
                          name: controller.nameController.text,
                          password: controller.passController.text
                        );
                        VxToast.show(context, msg: "Updated");
                      },
                      textColor: whiteColor,
                      title: "Save",
                    ))
          ],
        )
            .box
            .white
            .padding(EdgeInsets.all(16))
            .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    );
  }
}
