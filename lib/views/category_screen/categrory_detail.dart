import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/consts/consts.dart';
class CategoryDetails extends StatelessWidget {
final  String? title;
  const CategoryDetails({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
    );
  }
}