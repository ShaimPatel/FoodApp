import 'package:flutter/material.dart';
import 'package:foodapp/screens/Home/single_product.dart';
import 'package:foodapp/screens/products/product_overview.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';

class HerbsProductWidget extends StatefulWidget {
  const HerbsProductWidget({super.key});

  @override
  State<HerbsProductWidget> createState() => _HerbsProductWidgetState();
}

class _HerbsProductWidgetState extends State<HerbsProductWidget> {
  late ProductProvider getHerbsData;
  @override
  void initState() {
    getHerbsData = Provider.of<ProductProvider>(context, listen: false);
    getHerbsData.fechHerbsProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getHerbsData = Provider.of<ProductProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Herbs Seasonings",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "View All",
                style: TextStyle(
                  color: Colors.grey,
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
              child: getHerbsData.herbsProductList.isNotEmpty
                  ? Consumer<ProductProvider>(
                      builder: (context, value, child) => Row(
                          children:
                              value.geterbsProductDataList.map((e) {
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
                      }).toList()),
                    )
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
