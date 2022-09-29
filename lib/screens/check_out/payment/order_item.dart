import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Food"),
      subtitle: const Text("50 Gram"),
      leading: Image.network(
        "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
        width: 50,
      ),
    );
  }
}
