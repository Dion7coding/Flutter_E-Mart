import 'package:get/get.dart';

class CartController extends GetxController {
  var totalP = 0;
  calculate(data) {
    for (var i = 0; i < data.lenght; i++) {
      totalP = totalP + int.parse(data[i]['tprice'].toString());
    }
  }
}
