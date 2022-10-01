import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/count_item.dart';
import 'dart:developer' as developer;

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final Function onClick;
  final String productId;

  const SingleProduct({
    super.key,
    required this.productImage,
    required this.productName,
    required this.onClick,
    required this.productId,
  });

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var selectedUnit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Container(
          height: 260,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 5,
                ),
                child: SizedBox(
                  height: 140,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      widget.onClick();
                    },
                    child: Hero(
                      tag: widget.productId,
                      child: Image.network(
                        widget.productImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 110,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        widget.productName,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 2, left: 20),
                      child: Text(
                        "\$50",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: const Color(0xffd6b733))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("HerbsProducts")
                                    .doc(widget.productId)
                                    .collection("productUnit")
                                    .snapshots(),
                                // .snapshots(includeMetadataChanges: true),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Text(
                                      "Loading",
                                      style: TextStyle(
                                        fontSize: 4,
                                      ),
                                    );
                                  } else {
                                    List<DropdownMenuItem> productUnit = [];
                                    developer.log(
                                        " length => ${snapshot.connectionState}");

                                    for (int i = 0;
                                        i < snapshot.data!.docs.length;
                                        i++) {
                                      DocumentSnapshot snaps =
                                          snapshot.data!.docs[i];
                                      var d = snaps.data()!;

                                      developer.log(
                                          "Data of snap => ${d.toString()}");
                                      productUnit.add(
                                        DropdownMenuItem(
                                          value: snaps.id,
                                          child: Text(
                                            snaps.id.toString(),
                                            style: const TextStyle(
                                              fontSize: 3,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    return Row(
                                      children: [
                                        DropdownButton(
                                          iconSize: 9,
                                          items: productUnit,
                                          onChanged: (productUnitvalue) {
                                            setState(() {
                                              selectedUnit = productUnitvalue;
                                            });
                                          },
                                          value: selectedUnit,
                                          isExpanded: false,
                                          hint: const Text(
                                            "Select",
                                            style: TextStyle(
                                              fontSize: 8,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        CountItem(
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productName: widget.productName,
                          productPrice: 34,
                          productWeight: '',
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
