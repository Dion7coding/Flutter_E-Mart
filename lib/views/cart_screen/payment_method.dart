import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';
import 'cart_screen.dart';
import 'package:emart_app/controller/cart_controller.dart';
import 'package:emart_app/controller/product_controller.dart';
import 'package:emart_app/consts/consts.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {

  var controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPress: () {},
          color: redColor,
          textColor: whiteColor,
          title: "Place my order",
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: "Choose Payment Method"
            .text
            .fontFamily(semibold)
            .color(whiteColor)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(
          () => Column(
            children: List.generate(PaymentMethodsImg.length, (index) {
              return GestureDetector(
                onTap : () {
                  controller.changePaymentIndex(index);
                },
                child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: controller.paymentIndex.value == index ? redColor : Colors.transparent,
                          width: 5,
                        )),
                    margin: EdgeInsets.only(bottom: 8),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset(PaymentMethodsImg[index],
                            width: double.infinity, height: 120, fit: BoxFit.cover),
                        controller.paymentIndex.value == index ? Transform.scale(
                          scale: 1.3,
                          child: Checkbox(
                            activeColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            value: true,
                            onChanged: (value) {},
                          ),
                        ): Container(),
                      ],
                    )),
              );
            }),
          ),
        ),
      ),
    );
  }
}
