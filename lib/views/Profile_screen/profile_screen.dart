import 'package:emart_app/controller/profile_controller.dart';
import 'package:emart_app/views/about_page/about_page.dart';
import 'package:emart_app/views/orders_screen/orders_screen.dart';
import 'package:emart_app/views/whistlist_screen/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/Profile_screen/components/details_card.dart';
import 'package:emart_app/views/Profile_screen/edit_screen.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: FireStoreServices.getUser(currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else {
            var data = snapshot.data!.docs[0];

            // Assert that the two lists have the same length
            assert(profileButtonsList.length == profileButtonIcon.length);

            return SafeArea(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    20.heightBox,
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
                                "Welcome"
                                    .text
                                    .fontFamily(semibold)
                                    .white
                                    .make(),
                                "${data['name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .white
                                    .make()
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: whiteColor),
                            ),
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signoutMethod(context: context);
                              Get.offAll(() => const LoginScreen());
                            },
                            child:
                                "Logout".text.fontFamily(semibold).white.make(),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,

                    30.heightBox,
                    // Buttons section
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
                          onTap: () {
                            switch (index) {
                              case 0:
                                Get.to(() => OrdersScreen());
                                break;
                              case 1:
                                Get.to(() => WishlistScreen());
                              case 2:
                                Get.to(() => EditProfileScreen(
                                      data: data,
                                    ));
                              case 3:
                               Get.to(() => About_page());
                                break;
                            }
                          },
                          leading: Image.asset(
                            profileButtonIcon[index],
                            width: 24,color: Colors.black,
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
                        .make(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
