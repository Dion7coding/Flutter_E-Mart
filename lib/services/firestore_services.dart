import 'package:emart_app/consts/consts.dart';

class FireStoreServices {
  //get users data
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  //get products according to category
  static getProducts(category) {
    return firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  //get cart
  static getCart(uid) {
    return firestore
        .collection(cartcollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  //delete document
  static deleteDocument(docId) {
    return firestore.collection(cartcollection).doc(docId).delete();
  }

  //get featured products methos
  static getFeaturedProducts() {
    return firestore
        .collection(productsCollection)
        .where('p_trending', isEqualTo: true)
        .get();
  }

  //get limited products methos
  static getLimitedProducts() {
    return firestore
        .collection(productsCollection)
        .where('p_limited', isEqualTo: true)
        .get();
  }
 //wishlist
  static getWishlists(){
    return firestore.collection(productsCollection).where('p_wishlist',arrayContains: currentUser!.uid).snapshots();
  }

  //Orders
  static getAllOrders(){
    return firestore.collection(ordersCollection).where('order_by',isEqualTo: currentUser!.uid).snapshots();
  }
}

