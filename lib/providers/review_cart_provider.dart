import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Models/review_cart.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourRevieeCart")
        .doc(cartId)
        .set(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdded": true,
      },
    );
  }

  List<ReviewCartModel> reviewCartList = [];

  reviewCartData() async {
    List<ReviewCartModel> newList = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourRevieeCart")
        .get();
    for (var reviewdata in reviewCartValue.docs) {
      var reviewCartModel = ReviewCartModel(
        cartId: reviewdata.get("cartId"),
        cartImage: reviewdata.get("cartImage"),
        cartName: reviewdata.get("cartName"),
        cartPrice: reviewdata.get("cartPrice"),
        cartQuantity: reviewdata.get("cartQuantity"),
      );
      newList.add(reviewCartModel);
    }
    reviewCartList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewData {
    return reviewCartList;
  }

//! Delete Review Cart Item ....

  deleteReviewCartItem(cartId) {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourRevieeCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
