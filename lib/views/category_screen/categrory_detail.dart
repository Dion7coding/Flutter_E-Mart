import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/consts/consts.dart';

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
              itemCount: 12,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250),
              itemBuilder: (context, index) {
                return Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      psg_nike,
                      height: 150,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    "PSG Shoe - Nike".text.color(blackColor).fontFamily(bold).make(),
                    10.heightBox,
                    "\$100".text.color(blackColor).fontFamily(bold).make(),
                    10.heightBox
                  ],
                )
                    .box
                    .gray100
                    .margin(EdgeInsets.symmetric(horizontal: 4))
                    .roundedSM
                    .padding(EdgeInsets.all(12))
                    .make();
              },
            ))
          ],
        ),
      ),
    ));
  }
}
