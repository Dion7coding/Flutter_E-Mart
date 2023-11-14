import 'package:emart_app/views/category_screen/item_detail.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: title!.text.fontFamily(bold).white.make()),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            //itemsContainer
            Expanded(
                child: GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      psg_nike,
                      height: 150,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: "PSG Shoe - Nike"
                          .text
                          .color(blackColor)
                          .fontFamily(bold)
                          .make(),
                    ),
                    10.heightBox,
                    Padding(
                      padding: const EdgeInsets.only(left:55),
                      child: "\$100".text.color(blackColor).fontFamily(bold).make(),
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
                  Get.to(() => ItemDetails(title: "Dummy item"));
                });
              },
            ))
          ],
        ),
      ),
    ));
  }
}
