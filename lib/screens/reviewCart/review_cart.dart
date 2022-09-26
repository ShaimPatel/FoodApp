import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/review_cart_provider.dart';
import 'package:foodapp/screens/reviewCart/review_cart_item.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class ReviewCart extends StatefulWidget {
  const ReviewCart({super.key});

  @override
  State<ReviewCart> createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  late ReviewCartProvider reviewCartProvider;
  @override
  void initState() {
    reviewCartProvider = Provider.of(context, listen: false);
    reviewCartProvider.reviewCartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of(context);
    developer.log("legth => ${reviewCartProvider.getReviewData.length}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.appprimaryColor,
        title: const Text("Review Cart"),
      ),
      bottomNavigationBar: ListTile(
        title: const Text("Total amount"),
        subtitle: Text(
          "\$ 170.0",
          style: TextStyle(color: AppColors.appprimaryColor),
        ),
        trailing: SizedBox(
          width: 170,
          height: 45,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            onPressed: () {},
            child: const Text("Submit"),
          ),
        ),
      ),
      body: reviewCartProvider.getReviewData.isEmpty
          ? const Center(
              child: Text("No Item is Added"),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewData.length,
              itemBuilder: (ctx, index) {
                return ReviewCartItem(
                  productId: reviewCartProvider.getReviewData[index].cartId,
                  productImage:
                      reviewCartProvider.getReviewData[index].cartImage,
                  productName: reviewCartProvider.getReviewData[index].cartName,
                  productPrice: reviewCartProvider
                      .getReviewData[index].cartPrice
                      .toString(),
                  productQuantity: reviewCartProvider
                      .getReviewData[index].cartQuantity
                      .toString(),
                );
              }),
    );
  }
}
