import 'package:flutter/material.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addressType;
  const SingleDeliveryItem(
      {super.key,
      required this.title,
      required this.address,
      required this.number,
      required this.addressType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            enabled: true,
            visualDensity: VisualDensity.comfortable,
            isThreeLine: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                Container(
                  width: 60,
                  padding: const EdgeInsets.all(1),
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      addressType,
                      style: const TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  number,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            leading: Radio(
              value: 4,
              groupValue: 4,
              activeColor: Colors.green[700],
              onChanged: (value) {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              height: 2,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
