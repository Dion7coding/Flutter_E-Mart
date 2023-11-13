import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/auth_screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //
  var isLoading = false.obs;

  //textcointrollers
  var emailControllers = TextEditingController();
  var passwordControllers = TextEditingController();

  //login method

  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControllers.text, password: passwordControllers.text);

      // Optionally, you may use userCredential for further operations.
    } on FirebaseAuthException catch (e) {
      VxToast.show(context,
          msg: e.toString()); // Use e.message instead of e.toString()
    }

    return userCredential;
  }

  //signup method
  Future<UserCredential?> Signup({email, password, context}) async {
    UserCredential? userCredential;

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storing data method
  storeUserData({name, password, email}) async {
    DocumentReference store =
        await firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'name': Name,
      'password': password,
      'email': email,
      'id': currentUser!.uid
    });
  }

  //signout method
  signoutMethod({context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
