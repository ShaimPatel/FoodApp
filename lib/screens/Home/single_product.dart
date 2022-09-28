import 'package:flutter/material.dart';

import '../../widgets/count_item.dart';

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final Function onClick;
  final String productId;

  const SingleProduct(
      {super.key,
      required this.productImage,
      required this.productName,
      required this.onClick,
      required this.productId});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: "50",
          child: Row(children: const [
            Text("50 ",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffd6b733),
                )),
            Text(
              "Gram",
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: Color(0xffd6b733),
              ),
            )
          ])),
      DropdownMenuItem(
          value: "100",
          child: Row(children: const [
            Text("100 ",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffd6b733),
                )),
            Text(
              "Gram",
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: Color(0xffd6b733),
              ),
            )
          ])),
      DropdownMenuItem(
          value: "250",
          child: Row(children: const [
            Text("250 ",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffd6b733),
                )),
            Text(
              "Gram",
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: Color(0xffd6b733),
              ),
            )
          ])),
      DropdownMenuItem(
          value: "500",
          child: Row(children: const [
            Text("500 ",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffd6b733),
                )),
            Text(
              "Gram",
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: Color(0xffd6b733),
              ),
            )
          ])),
      DropdownMenuItem(
          value: "1",
          child: Row(children: const [
            Text("1 ",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffd6b733),
                )),
            Text(
              "Kg",
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: Color(0xffd6b733),
              ),
            )
          ])),
    ];
    return menuItems;
  }

  String selectedValue = "50";

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
                              DropdownButton(
                                value: selectedValue,
                                items: dropdownItems,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                  });
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
                          productWeight: selectedValue,
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
