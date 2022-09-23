import 'package:flutter/material.dart';

import '../../Home/single_product.dart';

class RootProductWidget extends StatelessWidget {
  const RootProductWidget({super.key});

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
                "Root Vegetable",
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
                    onClick: () {},
                    productImage:
                        "https://freepngimg.com/save/17893-vegetable-free-png-image/1470x1103",
                    productName: 'Green vegitable',
                  ),
                  SingleProduct(
                    onClick: () {},
                    productImage:
                        "https://www.freepnglogos.com/uploads/vegetables-png/vegetables-about-our-philosophy-super-healthy-kids-23.png",
                    productName: 'Green vegitable',
                  ),
                  SingleProduct(
                    onClick: () {},
                    productImage:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwBelBRcvoPEG5uEKE6xFxy03kq-HgDYEs5g&usqp=CAU",
                    productName: 'Green vegitable gdjhgdhhghdgh  gdhghgh  ',
                  ),
                  SingleProduct(
                    onClick: () {},
                    productImage:
                        "https://freepngimg.com/save/17893-vegetable-free-png-image/1470x1103",
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
