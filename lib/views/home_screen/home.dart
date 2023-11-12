import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:emart_app/consts/consts.dart';

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
      Container(
        color: Colors.amber,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.green,
      ),
    ];

    return Scaffold(
      body: Column(children: [
        Expanded(child: navBody.elementAt(myindex))
      ],),
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
    );
  }
}
