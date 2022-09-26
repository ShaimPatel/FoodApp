import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/Models/user_model.dart';

class UserProvider with ChangeNotifier {
  void addUserData({
    required User currentUser,
    required String userName,
    required String userEmail,
    required String userImage,
  }) async {
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(currentUser.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userImage": userImage,
        "userUid": currentUser.uid,
      },
    );
  }

  List<UserModel> UserDetailsList = [];

  userDetails() async {
    List<UserModel> newList = [];
    QuerySnapshot userData =
        await FirebaseFirestore.instance.collection("userData").get();
    for (var data in userData.docs) {
      var userModel = UserModel(
        userName: data.get('userName'),
        userIamge: data.get('userImage'),
        userEmail: data.get('userEmail'),
        userUid: data.get('userUid'),
      );
      newList.add(userModel);
    }
    UserDetailsList = newList;
    notifyListeners();
  }

  List<UserModel> get getUserDataDetails {
    return UserDetailsList;
  }
}
