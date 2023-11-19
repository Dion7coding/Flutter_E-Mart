import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';
import 'cart_screen.dart';
import 'package:emart_app/controller/cart_controller.dart';
import 'package:emart_app/controller/product_controller.dart';
import 'package:emart_app/consts/consts.dart';

class PaymentMethods
 extends StatelessWidget {
  const PaymentMethods
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPress: (){
            
          },
          color: redColor,
          textColor: whiteColor,
          title: "Place my order",
        ),
      ),
      appBar: AppBar(
        title: "Choose Payment Method".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      
    );
  }
}
