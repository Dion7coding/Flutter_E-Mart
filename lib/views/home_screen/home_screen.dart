import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          //search Bar
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: lightGrey,
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: searchanything,
                    hintStyle: TextStyle(color: textfieldGrey)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  'Trending',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Image.asset(fire, height: context.screenHeight * 0.03),
              ],
            ),
          ),
          //Featured Product
          20.heightBox,
          Row(
            children: List.generate(
                6,
                (index) => Column(
                  children: [
                    Image.asset(psg_nike,width: 150,fit: BoxFit.cover,)
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(EdgeInsets.all(8))
                    .make()),
          )
        ],
      )),
    );
  }
}
