import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/screens/products/product_widgets/fresh_product.dart';
import 'package:foodapp/screens/products/product_widgets/herbs_product.dart';
import 'package:foodapp/screens/products/product_widgets/root_product.dart';

import '../search/search_screen.dart';
import 'drawer_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        backgroundColor: appprimaryColor,
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SearchPage())),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      drawer: const DrawerSide(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 130, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Color(0xffd1ad17),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Vegi',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.green,
                                          blurRadius: 10,
                                          offset: Offset(3, 3))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '30% Off',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.green[100],
                                fontWeight: FontWeight.bold),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'On all vegetables products',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
            const HerbsProductWidget(),
            const FreshProductWidget(),
            const RootProductWidget()
          ],
        ),
      ),
    );
  }
}
