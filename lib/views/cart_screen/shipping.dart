// ignore_for_file: unused_local_variable

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/cart_controller.dart';
import 'package:emart_app/views/cart_screen/payment_method.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(backgroundColor:Colors.black,
        title: "Shipping Info".text.fontFamily(semibold).color(whiteColor).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPress: (){
            if (controller.addressController.text.length > 10){
              Get.to(() => const PaymentMethods());
            } else {
              VxToast.show(context, msg: "please fill the form");
            }
          },
          color: redColor,
          textColor: whiteColor,
          title: "Continue",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              customTextField(hint: "Address", isPass: false, title: "Address", controller: controller.addressController),
              customTextField(hint: "City", isPass: false, title: "City", controller: controller.cityController),
              customTextField(hint: "State", isPass: false, title: "State", controller: controller.stateController),
              customTextField(hint: "Postal Code", isPass: false, title: "Postal Code", controller: controller.postalController),
              customTextField(hint: "Phone Number", isPass: false, title: "Phone Number", controller: controller.phoneController),
              
            ],
          ),
        ),
      ),
    );
  }
}