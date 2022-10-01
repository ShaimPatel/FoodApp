import 'package:flutter/material.dart';
import 'package:foodapp/screens/Home/single_product.dart';
import 'package:foodapp/screens/products/product_overview.dart';
import 'package:foodapp/widgets/shimmer_widget.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import '../../search/search_screen.dart';

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
            children: [
              const Text(
                "Herbs Seasonings",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => SearchPage(
                        searchData: getHerbsData.geterbsProductDataList,
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
              child: getHerbsData.herbsProductList.isNotEmpty
                  ? Consumer<ProductProvider>(
                      builder: (context, value, child) => Row(
                          children: value.geterbsProductDataList.map((e) {
                        Future.delayed(const Duration(seconds: 5));
                        return SingleProduct(
                          productImage: e.productImage,
                          productName: e.productName,
                          onClick: () {
                            Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      ProductOverview(
                                productName: e.productName,
                                productImage: e.productImage,
                                productId: e.productId,
                                productPrice: e.productPrice,
                                productQuantity: 2,
                              ),
                              transitionDuration:
                                  const Duration(milliseconds: 900),
                            ));
                          },
                          productId: e.productId,
                        );
                      }).toList()),
                    )
                  : Row(
                      children: const [
                        ShimmerWidgetPage(),
                        ShimmerWidgetPage(),
                        ShimmerWidgetPage(),
                        ShimmerWidgetPage(),
                        ShimmerWidgetPage(),
                      ],
                    ),

              // : const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
