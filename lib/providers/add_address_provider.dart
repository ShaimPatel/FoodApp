import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';

import '../Models/delivery_address_model.dart';

class AddAddressProvider with ChangeNotifier {
  bool isLoading = false;

  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController alternetMobileNumber = TextEditingController();
  TextEditingController society = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController landMark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pincode = TextEditingController();
  var addressType;
  LocationData? setLocation;

  void validator(context, type) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "First Name is Empty");
    } else if (secondName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Last Name is Empty");
    } else if (mobileNumber.text.isEmpty) {
      Fluttertoast.showToast(msg: "mobileNumber is Empty");
    } else if (alternetMobileNumber.text.isEmpty) {
      Fluttertoast.showToast(msg: "alternetMobileNumber is Empty");
    } else if (society.text.isEmpty) {
      Fluttertoast.showToast(msg: "society is Empty");
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: "street is Empty");
    } else if (landMark.text.isEmpty) {
      Fluttertoast.showToast(msg: "landMark is Empty");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "city is Empty");
    } else if (area.text.isEmpty) {
      Fluttertoast.showToast(msg: "area is Empty");
    } else if (pincode.text.isEmpty) {
      Fluttertoast.showToast(msg: "pincode is Empty");
    } else if (setLocation!.latitude == null &&
        setLocation!.longitude == null) {
      Fluttertoast.showToast(msg: "Location is Empty");
    } else {
      print('Location $setLocation');
      isLoading = true;
      notifyListeners();
      FirebaseFirestore.instance
          .collection("AddDeliveryAddress")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "firstName": firstName.text,
        "secondName": secondName.text,
        "mobileNumber": mobileNumber.text,
        "alternetMobileNumber": alternetMobileNumber.text,
        "society": society.text,
        "street": street.text,
        "landMark": landMark.text,
        "city": city.text,
        "area": area.text,
        "pincode": pincode.text,
        "addressType": type,
        "latitude": setLocation!.latitude,
        "logitude": setLocation!.longitude,
      }).then((value) {
        isLoading == false;
        notifyListeners();
        Fluttertoast.showToast(msg: "Address Added");
        clearText();
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  void clearText() {
    firstName.clear();
    secondName.clear();
    mobileNumber.clear();
    alternetMobileNumber.clear();
    society.clear();
    street.clear();
    landMark.clear();
    city.clear();
    area.clear();
    pincode.clear();
    notifyListeners();
  }

  // ignore: prefer_typing_uninitialized_variables
  var deliveryAddres;
  List<DeliveryAddresModel> addresList = [];
  fechDeliveryAddress() async {
    List<DeliveryAddresModel> newList = [];
    DocumentSnapshot db = await FirebaseFirestore.instance
        .collection("AddDeliveryAddress")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (db.exists) {
      deliveryAddres = DeliveryAddresModel(
          firstName: db.get('firstName'),
          lastName: db.get('secondName'),
          mobileNumber: db.get('mobileNumber'),
          alternetMobileNumber: db.get('alternetMobileNumber'),
          society: db.get('society'),
          street: db.get('street'),
          landmark: db.get('landMark'),
          city: db.get('city'),
          area: db.get('area'),
          pincode: db.get('pincode'),
          addressType: db.get("addressType"),
          latitude: db.get('latitude'),
          longitude: db.get('logitude'));
      newList.add(deliveryAddres);
      notifyListeners();
    }
    addresList = newList;
    notifyListeners();
  }

  List<DeliveryAddresModel> get getDeliveryAddress {
    return addresList;
  }

}
