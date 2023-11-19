import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/loading_indicator.dart';
import 'package:emart_app/controller/product_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/category_screen/item_detail.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
      Get.put<ProductController>(ProductController());
    return bgWidget(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                backgroundColor: Colors.black,
                title: title!.text.fontFamily(bold).white.make()),
            body: StreamBuilder(
              stream: FireStoreServices.getProducts(title),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: (loadingIndicator()));
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: "No Products Found!".text.color(whiteColor).make(),
                  );
                } else {
                  var controller = Get.find<ProductController>();
                  var data = snapshot.data!.docs;
                  return Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        //itemsContainer
                        Expanded(
                            child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 250,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  data[index]['p_imgs'][0],
                                  height: 150,
                                  width: 210,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: "${data[index]['p_name']}"
                                      .text
                                      .color(blackColor)
                                      .fontFamily(bold)
                                      .make(),
                                ),
                                10.heightBox,
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: "${data[index]['p_price']}"
                                      .numCurrency
                                      .text
                                      .color(blackColor)
                                      .fontFamily(bold)
                                      .make(),
                                ),
                                10.heightBox
                              ],
                            )
                                .box
                                .gray100
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .roundedSM
                                .padding(EdgeInsets.all(12))
                                .make()
                                .onTap(() {
                              controller.checifFav(data[index]);
                              Get.to(() => ItemDetails(
                                    title: "${data[index]['p_name']}",
                                    data: data[index],
                                  ));
                            });
                          },
                        ))
                      ],
                    ),
                  );
                }
              },
            )));
  }
}
