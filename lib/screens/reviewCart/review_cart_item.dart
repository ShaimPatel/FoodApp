import 'package:flutter/material.dart';
import 'package:foodapp/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

class ReviewCartItem extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  final String productId;
  final String productQuantity;
  final String productWeight;

  const ReviewCartItem({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
    required this.productQuantity,
    required this.productWeight,
  }) : super(key: key);

  @override
  State<ReviewCartItem> createState() => _ReviewCartItemState();
}

class _ReviewCartItemState extends State<ReviewCartItem> {
  late ReviewCartProvider reviewCartProvider;
  // getAddedTotalItem() {
  //   FirebaseFirestore.instance
  //       .collection("ReviewCart")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection("YourRevieeCart")
  //       .doc(widget.productId)
  //       .get()
  //       .then(
  //         (value) => {
  //           if (mounted) {if (value.exists) {}},
  //         },
  //       );
  // }

  @override
  void initState() {
    reviewCartProvider =
        Provider.of<ReviewCartProvider>(context, listen: false);
    // reviewCartProvider.deleteReviewCartItem(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.0,
              child: Image.network(widget.productImage),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$ ${widget.productPrice} ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        widget.productWeight == "1"
                            ? "${widget.productWeight}Kg"
                            : " ${widget.productWeight}Gram",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: InkWell(
                onTap: () {
                  showDialog(
                    barrierColor: Colors.white70,
                    useSafeArea: true,
                    barrierDismissible: false,
                    barrierLabel: "Delete Item",
                    context: context,
                    builder: (context) => AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            reviewCartProvider
                                .deleteReviewCartItem(widget.productId);
                            reviewCartProvider.reviewCartData();
                            Navigator.of(context).pop();
                            setState(() {});
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                      title: const Text("Delete Item"),
                      contentPadding: const EdgeInsets.all(20.0),
                      content: const Text("Are you sure.?"),
                    ),
                  );
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.blueGrey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
