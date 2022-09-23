import 'package:flutter/material.dart';
import 'package:foodapp/screens/products/product_overview.dart';

import '../../Home/single_product.dart';

class HerbsProductWidget extends StatelessWidget {
  const HerbsProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                children: [
                  SingleProduct(
                    onClick: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProductOverview(
                          productImage:
                              'https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                          productName: 'shivam',
                        ),
                      ),
                    ),
                    productImage:
                        "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                    productName: 'Shivam',
                  ),
                  SingleProduct(
                    onClick: () => print("object"),
                    productImage:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLeUwmN0JJ92gTVoTUSP_ZwXwk2dSXaFHiGw&usqp=CAU",
                    productName: 'Broccoli ',
                  ),
                  SingleProduct(
                    onClick: () {},
                    productImage:
                        "https://pngimg.com/uploads/spinach/spinach_PNG26.png",
                    productName: 'Butter Leaf',
                  ),
                  SingleProduct(
                    onClick: () {},
                    productImage:
                        "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                    productName: 'Green vegitable',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
