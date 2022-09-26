import 'package:flutter/material.dart';
import 'package:foodapp/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';

class WishListItem extends StatefulWidget {
  final String wishListName;
  final String wishListImage;
  final String wishListPrice;
  final String wishListId;
  final String wishListQuantity;
  const WishListItem(
      {super.key,
      required this.wishListName,
      required this.wishListImage,
      required this.wishListPrice,
      required this.wishListId,
      required this.wishListQuantity});

  @override
  State<WishListItem> createState() => _WishListItemState();
}

class _WishListItemState extends State<WishListItem> {
  late WishListProvider wishListProvider;
  @override
  void initState() {
    wishListProvider = Provider.of<WishListProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of<WishListProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.0,
              child: Image.network(widget.wishListImage),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.wishListName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$ ${widget.wishListPrice} ",
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
                        "${widget.wishListQuantity} Gram",
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
                            wishListProvider
                                .deleteWishListItem(widget.wishListId);
                            wishListProvider.wishListData();

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
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
