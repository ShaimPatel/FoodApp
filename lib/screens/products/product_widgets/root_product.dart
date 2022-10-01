import 'package:flutter/material.dart';
import 'package:foodapp/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../widgets/shimmer_widget.dart';
import '../../Home/single_product.dart';
import '../../search/search_screen.dart';
import '../product_overview.dart';

class RootProductWidget extends StatefulWidget {
  const RootProductWidget({super.key});

  @override
  State<RootProductWidget> createState() => _RootProductWidgetState();
}

class _RootProductWidgetState extends State<RootProductWidget> {
  late ProductProvider rootProductData;
  @override
  void initState() {
    rootProductData = Provider.of<ProductProvider>(context, listen: false);
    rootProductData.fetchRootProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    rootProductData = Provider.of<ProductProvider>(context);
    print(rootProductData.getRootProductList.length);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Root Vegetable",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => SearchPage(
                        searchData: rootProductData.getRootProductList,
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
              child: rootProductData.rootProductDataList.isNotEmpty
                  ? Row(
                      children: rootProductData.getRootProductList.map((e) {
                      return SingleProduct(
                        productImage: e.productImage,
                        productName: e.productName,
                        onClick: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductOverview(
                                    productName: e.productName,
                                    productImage: e.productImage,
                                    productId: e.productId,
                                    productPrice: e.productPrice,
                                    productQuantity: 3,
                                  )));
                        },
                        productId: e.productId,
                      );
                    }).toList())
                  : Row(
                      children: const [
                        ShimmerWidgetPage(),
                        ShimmerWidgetPage(),
                        ShimmerWidgetPage(),
                        ShimmerWidgetPage(),
                        ShimmerWidgetPage(),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
