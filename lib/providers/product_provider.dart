import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Models/product_model.dart';

class ProductProvider with ChangeNotifier {
  var productModel;
  List<ProductModel> searchAllItem = [];
  productModels(QueryDocumentSnapshot queryDocumentSnapshot) {
    productModel = ProductModel(
        productImage: queryDocumentSnapshot.get("productImage"),
        productName: queryDocumentSnapshot.get("productName"),
        productPrice:
            int.parse(queryDocumentSnapshot.get("productPrice").toString()),
        productId: queryDocumentSnapshot.get("productId"));

    searchAllItem.add(productModel);
  }

  //! ...... Search All Item From data base ......
  List<ProductModel> get getAllProductItem {
    return searchAllItem;
  }

  //! ...... Here are The Provider is HerbsData ......
  List<ProductModel> herbsProductList = [];

  fechHerbsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot getData =
        await FirebaseFirestore.instance.collection("HerbsProducts").get();
    for (var element in getData.docs) {
      productModels(element);
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
      productModels(fruitsData);

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
      productModels(getData);
      newRootList.add(productModel);
    }
    rootProductDataList = newRootList;
    notifyListeners();
  }

  List<ProductModel> get getRootProductList {
    return rootProductDataList;
  }
}
