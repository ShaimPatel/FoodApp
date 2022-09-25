import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/screens/reviewCart/review_cart_item.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (_, __) {
            return const ReviewCartItem();
          }),
    );
  }
}
