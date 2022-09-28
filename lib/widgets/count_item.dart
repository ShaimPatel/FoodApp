import 'package:flutter/material.dart';
import 'package:foodapp/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

class CountItem extends StatefulWidget {
  const CountItem(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.productId,
      required this.productPrice,
      required this.productWeight});

  final String productId;
  final String productImage;
  final String productName;
  final int productPrice;
  final String productWeight;

  @override
  State<CountItem> createState() => _CountItemState();
}

class _CountItemState extends State<CountItem> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    final reviewCartData = Provider.of<ReviewCartProvider>(context);
    return Container(
        height: 35,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xffd6b733))),
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      if (count > 1) {
                        setState(() {
                          count--;
                        });
                      }
                      if (count == 1) {
                        setState(() {
                          isTrue = false;
                        });
                      }
                    },
                    child: const Icon(
                      Icons.remove,
                      size: 20,
                      color: Color(0xffd6b733),
                    ),
                  ),
                  Text(
                    count.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffd6b733),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;

                        isTrue = false;
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 20,
                      color: Color(0xffd6b733),
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                    print(widget.productWeight);
                    reviewCartData.addReviewCartData(
                      cartId: widget.productId,
                      cartName: widget.productName,
                      cartImage: widget.productImage,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                      productWeight: widget.productWeight,
                    );
                  },
                  child: Text(
                    "Add".toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xffd6b733),
                    ),
                  ),
                ),
              ));
  }
}
