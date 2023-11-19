import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/Profile_screen/profile_screen.dart';
import 'package:emart_app/views/cart_screen/cart_screen.dart';
import 'package:emart_app/views/category_screen/category_screen.dart';
import 'package:emart_app/views/home_screen/home_screen.dart';
import 'package:emart_app/widgets_common/exit_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myindex = 0;
  @override
  Widget build(BuildContext context) {
    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen()
    ];

    return WillPopScope(
      onWillPop: () async {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => exitDialog(context),
        );
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [Expanded(child: navBody.elementAt(myindex))],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.black,
          items: const <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.category, size: 30),
            Icon(Icons.shopping_bag, size: 30),
            Icon(Icons.person_2_outlined, size: 30),
          ],
          onTap: (index) {
            setState(() {
              myindex = index;
            });
          },
        ),
      ),
    );
  }
}
