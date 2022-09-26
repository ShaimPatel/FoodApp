import 'package:flutter/material.dart';
import 'package:foodapp/screens/Home/single_product.dart';
import 'package:foodapp/screens/search/search_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import '../product_overview.dart';

class FreshProductWidget extends StatefulWidget {
  const FreshProductWidget({super.key});

  @override
  State<FreshProductWidget> createState() => _FreshProductWidgetState();
}

class _FreshProductWidgetState extends State<FreshProductWidget> {
  late ProductProvider getFreshFruitsData;
  @override
  void initState() {
    getFreshFruitsData = Provider.of<ProductProvider>(context, listen: false);
    getFreshFruitsData.fetchFreshFruitsProductdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getFreshFruitsData = Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Fresh Fruits",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => SearchPage(
                        searchData: getFreshFruitsData.getFreshFruitsData,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: getFreshFruitsData.freshFruitsDataList.isNotEmpty
                  ? Row(
                      children: getFreshFruitsData.getFreshFruitsData.map((e) {
                      return SingleProduct(
                        productImage: e.productImage,
                        productName: e.productName,
                        onClick: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductOverview(
                                  productName: e.productName,
                                  productImage: e.productImage)));
                        },
                      );
                    }).toList())
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
