import 'package:cloud_firestore/cloud_firestore.dart' show SetOptions;
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/views/Profile_screen/edit_screen.dart';

class ProfileController extends GetxController{
  var isloading = false.obs;
  var nameController = TextEditingController();
  var passController = TextEditingController();
  updateProfile({name, password}) async{
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.set({'name': name, 'password': password}, SetOptions(merge: true));
    isloading(false);
  }
}