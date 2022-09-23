import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
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
                  "https://freepngimg.com/save/17893-vegetable-free-png-image/1470x1103",
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
                    children: [
                      Text(
                        "Product Name",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "50\$/100 Gram",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "50 Gram",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Center(
                          child: Icon(
                            Icons.arrow_drop_down,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 32),
              child: Container(
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.green,
                        size: 20,
                      ),
                      Text(
                        "Add".toUpperCase(),
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
