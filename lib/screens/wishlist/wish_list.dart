import 'package:flutter/material.dart';
import 'package:foodapp/providers/wish_list_provider.dart';
import 'package:foodapp/screens/wishlist/wish_list_item.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  late WishListProvider wishListProvider;
  @override
  void initState() {
    wishListProvider = Provider.of<WishListProvider>(context, listen: false);
    wishListProvider.wishListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of<WishListProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.appprimaryColor,
        title: const Text("WishList Cart"),
      ),
      // bottomNavigationBar: ListTile(
      //   title: const Text("Total amount"),
      //   subtitle: Text(
      //     "\$ 170.0",
      //     style: TextStyle(color: AppColors.appprimaryColor),
      //   ),
      //   trailing: SizedBox(
      //     width: 170,
      //     height: 45,
      //     child: ElevatedButton(
      //       style: ButtonStyle(
      //         backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
      //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //           RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(18.0),
      //             side: const BorderSide(
      //               color: Colors.transparent,
      //             ),
      //           ),
      //         ),
      //       ),
      //       onPressed: () {},
      //       child: const Text("Submit"),
      //     ),
      //   ),
      // ),
      body: wishListProvider.getWishListData.isEmpty
          ? const Center(
              child: Text("No wish Item is Added"),
            )
          : ListView.builder(
              itemCount: wishListProvider.getWishListData.length,
              itemBuilder: (ctx, index) {
                return WishListItem(
                  wishListId: wishListProvider.getWishListData[index].productId,
                  wishListImage:
                      wishListProvider.getWishListData[index].productImage,
                  wishListName:
                      wishListProvider.getWishListData[index].productName,
                  wishListPrice: wishListProvider
                      .getWishListData[index].productPrice
                      .toString(),
                  wishListQuantity: "21",
                );
              }),
    );
  }
}
