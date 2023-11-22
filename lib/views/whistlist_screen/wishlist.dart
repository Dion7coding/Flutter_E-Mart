import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/loading_indicator.dart';
import 'package:emart_app/services/firestore_services.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(backgroundColor: blackColor,
        title: "My Wishlist".text.color(whiteColor).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FireStoreServices.getWishlists(),
       builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
         if(!snapshot.hasData){
          return Center(
            child: loadingIndicator(),
          );
         }else if(snapshot.data!.docs.isEmpty){
          return Center(
            child: "Nothing in Wishlist yet".text.color(darkFontGrey).make(),
          );
         }else{
          var data = snapshot.data!.docs;
          return Column(
            children: [
              Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                                leading: Image.network('${data[index]['p_imgs'][0]}',
                                width: 120,
                                fit: BoxFit.cover,
                                ),
                                title:
                                    "${data[index]['p_name']}"
                                        .text
                                        .fontFamily(semibold)
                                        .size(16)
                                        .make(),
                                subtitle: "${data[index]['p_price']}"
                                    .numCurrency
                                    .text
                                    .fontFamily(semibold)
                                    .size(16)
                                    .make(),
                                trailing: const Icon(
                                  Icons.favorite,
                                  color: Colors.black,
                                ).onTap(() {
                                  
                                }),
                              );;
              },
            ),
              ),
            ],
          );
         }
       },
       ),
    );
  }
}