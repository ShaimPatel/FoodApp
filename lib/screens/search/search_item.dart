// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodapp/config/colors.dart';

class SearchItem extends StatefulWidget {
  final String productImage;
  final String productName;
  final double productPrice;

  const SearchItem({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      height: 120,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            child: SizedBox(
              height: double.infinity,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.productImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$ ${widget.productPrice}",
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    margin: const EdgeInsets.only(right: 1),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "50 G",
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.black54,
                          ),
                        ),
                        Center(
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              alignment: Alignment.center,
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.green,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
