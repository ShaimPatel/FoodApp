import 'package:flutter/material.dart';
import 'package:foodapp/screens/search/search_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          const ListTile(
            title: Text("Items"),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 52,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                fillColor: const Color.fromARGB(255, 236, 232, 232),
                filled: true,
                hintText: "Search item in the store",
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (_, __) {
                  return const SearchItem();
                }),
          )
        ],
      ),
    );
  }
}
