import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/views/category_screen/categrory_detail.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
      
        backgroundColor: Colors.black,
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding:EdgeInsets.all(MediaQuery.of(context).size.width/10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      categoriesImage[index],
                      height: 50,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ).box.white.rounded.clip(Clip.antiAlias).make().onTap(() {
              Get.to(() => CategoryDetails(title: categoriesList[index]));
            });
          },
        ),
      ),
    );
  }
}
