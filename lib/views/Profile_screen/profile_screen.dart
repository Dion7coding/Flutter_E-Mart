import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/views/Profile_screen/components/details_card.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.edit,
                    color: whiteColor,
                  ),
                ),
              ),
              //users details section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      color: Colors.white,
                      size: 50,
                    ).box.make(),
                    10.widthBox,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dummy User".text.fontFamily(semibold).white.make(),
                        "customer@example.com"
                            .text
                            .fontFamily(semibold)
                            .white
                            .make()
                      ],
                    )),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: whiteColor)),
                        onPressed: () async {
                          await Get.put(AuthController())
                              .signoutMethod(context: context);
                          Get.offAll(() => const LoginScreen());
                        },
                        child: "Logout".text.fontFamily(semibold).white.make())
                  ],
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DetailsCard(
                      count: "00",
                      title: "Items in Cart",
                      width: context.screenWidth / 3.5),
                  DetailsCard(
                      count: "00",
                      title: "Wishlist",
                      width: context.screenWidth / 3.5),
                  DetailsCard(
                      count: "00",
                      title: "Your Orders",
                      width: context.screenWidth / 3.5)
                ],
              ),
              30.heightBox,
              //Buttons section
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Vx.gray500,
                  );
                },
                itemCount: profileButtonsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      profileButtonIcon[index],
                      width: 24,
                    ),
                    title: profileButtonsList[index]
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .color(blackColor)
                        .make(),
                  );
                },
              )
                  .box
                  .white
                  .rounded
                  .padding(EdgeInsets.symmetric(horizontal: 16))
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
