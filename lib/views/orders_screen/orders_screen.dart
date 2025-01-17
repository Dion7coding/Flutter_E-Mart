import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/loading_indicator.dart';
import 'package:emart_app/services/firestore_services.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(backgroundColor: Colors.black,
        title: "Order History".text.color(whiteColor).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FireStoreServices.getAllOrders(),
       builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
         if(!snapshot.hasData){
          return Center(
            child: loadingIndicator(),
          );
         }else if(snapshot.data!.docs.isEmpty){
          return Center(
            child: "No Orders Yet".text.color(darkFontGrey).make(),
          );
         }else{

          var data = snapshot.data!.docs;

        

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: "${index+1}".text.fontFamily(bold).color(lightGrey).make(),
                title: data[index]['order_code'].toString().text.color(redColor).fontFamily(semibold).make(),
                subtitle: data[index]['total_amount'].toString().numCurrency.text.fontFamily(bold).make(),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded, color: darkFontGrey,)),
              );
            }
          );
         }
       },
       ),
    );
      }
  }
