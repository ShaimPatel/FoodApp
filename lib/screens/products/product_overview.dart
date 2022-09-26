import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productId;
  final int productPrice;
  final int productQuantity;

  const ProductOverview(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.productId,
      required this.productPrice,
      required this.productQuantity});

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  Widget bonntonNavigatorBar({
    Color? iconColor,
    Color? backgroundColor,
    Color? color,
    required String title,
    IconData? iconData,
    required Function onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: const EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool wishListBool = false;

  @override
  Widget build(BuildContext context) {
    final wishListData = Provider.of<WishListProvider>(context);
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
              backgroundColor: AppColors.textColor,
              color: wishListBool != false ? Colors.green : Colors.white70,
              iconColor: wishListBool != false ? Colors.red : Colors.white70,
              title:
                  wishListBool == false ? "Add To WishList" : "Added WishList",
              iconData: wishListBool == false
                  ? Icons.favorite_outline
                  : Icons.favorite,
              onTap: () {
                setState(() {
                  wishListBool = !wishListBool;
                });
                wishListData.addWishListData(
                    wishListId: widget.productId,
                    wishListName: widget.productName,
                    wishListImage: widget.productImage,
                    wishListPrice: widget.productPrice,
                    wishListQuantity: widget.productQuantity);
              }),
          bonntonNavigatorBar(
              backgroundColor: AppColors.appprimaryColor,
              color: AppColors.textColor,
              iconColor: Colors.white70,
              title: "Go To Cart",
              iconData: Icons.shop_outlined,
              onTap: () {}),
        ],
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.appprimaryColor,
        title: const Text(
          "Product Overview",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: const Text("\$50"),
                  ),
                  Container(
                      height: 250,
                      padding: const EdgeInsets.all(40),
                      child: Hero(
                        // transitionOnUserGestures: true,
                        tag: widget.productId,
                        child: Image.network(
                          widget.productImage,
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Available Options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: 2,
                              groupValue: 1,
                              activeColor: Colors.green[700],
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                        const Text("\$${50}"),
                        // Count(
                        //   productId: widget.productId,
                        //   productImage: widget.productImage,
                        //   productName: widget.productName,
                        //   productPrice: widget.productPrice,
                        //   productUnit: '500 Gram',
                        // ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 17,
                                color: AppColors.appprimaryColor,
                              ),
                              Text(
                                "ADD",
                                style:
                                    TextStyle(color: AppColors.appprimaryColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: ListView(
                children: [
                  const Text(
                    "About This Product",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "of a customer. Wikipedi In marketing, a product is an object or system made available for consumer use; it is anything that can be offered to a market to satisfy the desire or need of a customer. Wikipedi",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor,
                    ),
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
