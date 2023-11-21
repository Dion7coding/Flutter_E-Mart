import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';
import 'cart_screen.dart';
import 'package:emart_app/controller/cart_controller.dart';
import 'package:emart_app/controller/product_controller.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  var controller = Get.put(CartController());
  Razorpay? _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Success Payment:${response.paymentId}");
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Error Here:${response.message}");
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "External Wallet is:${response.walletName}");
    // Do something when an external wallet is selected
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void makePayment() async {
   

    var options = {
      'key': 'rzp_test_pNVT6mr62CLtf7',
      'amount':
          controller.totalP.value * 100, //in the smallest currency sub-unit.
      'name': 'Sneak Store',
      'description': 'Fine T-Shirt',

      'prefill': {
        'contact': "${controller.phoneController}",
        'email': 'gaurav.kumar@example.com'
      }
    };
    try {
      _razorpay?.open(options);
      Get.offAll(()=>Home());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void cod ()async{
     showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    Get.offAll(()=>Home());
    VxToast.show(context, msg: "Order Placed");
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: "Choose Payment Method"
            .text
            .fontFamily(semibold)
            .color(whiteColor)
            .make(),
      ),
      body: Column(
        children: [
          Row(
            children: [
              150.heightBox,
              Container(
                child: Image.asset(
                  "assets/images/rozarpay.png",
                  height: context.screenHeight / 10,
                  width: context.screenWidth - 200,
                ),
              ),
              50.heightBox,
              ElevatedButton(
                  onPressed: () {
                    makePayment();
                  },
                  child: Text("Click to Pay"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black)),
            ],
          ),
          Row(
            children: [
              150.heightBox,
              Container(
                child: Image.asset(
                  "assets/images/cod.png",
                  height: context.screenHeight / 10,
                  width: context.screenWidth - 200,
                ),
              ),
              50.heightBox,
              ElevatedButton(
                onPressed: () {
                  cod();
                },
                child: Text("Click to Place Order"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
