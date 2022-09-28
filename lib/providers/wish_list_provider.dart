import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/Models/product_model.dart';

class WishListProvider with ChangeNotifier {
  void addWishListData({
    required String wishListId,
    required String wishListName,
    required String wishListImage,
    required int wishListPrice,
    required int wishListQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("WishListItem")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishListData")
        .doc(wishListId)
        .set(
      {
        "wishListId": wishListId,
        "wishListName": wishListName,
        "wishListImage": wishListImage,
        "wishListPrice": wishListPrice,
        "wishListQuantity": wishListQuantity,
        "wishList": true,
      },
    );
  }

  List<ProductModel> wishtList = [];

  wishListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("WishListItem")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishListData")
        .get();
    for (var data in reviewCartValue.docs) {
      var productModel = ProductModel(
          productId: data.get('wishListId'),
          productName: data.get('wishListName'),
          productImage: data.get('wishListImage'),
          productPrice: data.get('wishListPrice'),
          productUnit: data.get(''));
      newList.add(productModel);
    }
    wishtList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishListData {
    return wishtList;
  }

  //! Delete Review Cart Item ....

  deleteWishListItem(wishListId) {
    FirebaseFirestore.instance
        .collection("WishListItem")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishListData")
        .doc(wishListId)
        .delete();
    notifyListeners();
  }
}
