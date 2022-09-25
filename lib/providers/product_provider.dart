import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Models/product_model.dart';

class ProductProvider with ChangeNotifier {
  //! ...... Here are The Provider is HerbsData ......
  List<ProductModel> herbsProductList = [];

  fechHerbsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot getData =
        await FirebaseFirestore.instance.collection("HerbsProducts").get();
    for (var element in getData.docs) {
      print("....+   NAME    ....+" + element.get("productName"));
      var productModel = ProductModel(
        productImage: element.get("productImage"),
        productName: element.get("productName"),
        productPrice: int.parse(element.get("productPrice").toString()),
      );
      newList.add(productModel);
    }
    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get geterbsProductDataList {
    return herbsProductList;
  }

  //! ...... Here are FreshFruits Provider ......
  List<ProductModel> freshFruitsDataList = [];

  fetchFreshFruitsProductdata() async {
    List<ProductModel> newList = [];

    QuerySnapshot getData =
        await FirebaseFirestore.instance.collection("FreshFruits").get();
    for (var fruitsData in getData.docs) {
      var productModel = ProductModel(
        productImage: fruitsData.get("productImage"),
        productName: fruitsData.get("productName"),
        productPrice: int.parse(fruitsData.get("productPrice").toString()),
      );
      newList.add(productModel);
    }
    freshFruitsDataList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFreshFruitsData {
    return freshFruitsDataList;
  }

//! ...... Here are Root ProductData ......

  List<ProductModel> rootProductDataList = [];

  fetchRootProductData() async {
    List<ProductModel> newRootList = [];
    QuerySnapshot getRootListData =
        await FirebaseFirestore.instance.collection("RootProduct").get();
    for (var getData in getRootListData.docs) {
      var productModel = ProductModel(
        productImage: getData.get("productImage"),
        productName: getData.get("productName"),
        productPrice: int.parse(getData.get("productPrice").toString()),
      );
      newRootList.add(productModel);
    }
    rootProductDataList = newRootList;
    notifyListeners();
  }

  List<ProductModel> get getRootProductList {
    return rootProductDataList;
  }
}
