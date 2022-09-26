// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodapp/Models/product_model.dart';
import 'package:foodapp/screens/search/search_item.dart';

class SearchPage extends StatefulWidget {
  List<ProductModel> searchData;
  SearchPage({
    Key? key,
    required this.searchData,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String strringQuery = "";

  List<ProductModel> searchAllData(String query) {
    List<ProductModel> searchFood = widget.searchData.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> queryList = searchAllData(strringQuery);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          SizedBox(
            // color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: [
                const ListTile(
                  title: Text("Items"),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 52,
                  child: TextField(
                    enableSuggestions: true,
                    onChanged: (value) {
                      setState(() {
                        strringQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      fillColor: const Color.fromARGB(255, 236, 232, 232),
                      filled: true,
                      hintText: "Search item in the store",
                      suffixIcon: const Icon(Icons.search),
                      disabledBorder: InputBorder.none,
                      enabled: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: queryList.map((e) {
                  return SearchItem(
                    productImage: e.productImage,
                    productName: e.productName,
                    productPrice: double.parse("${e.productPrice}".toString()),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
