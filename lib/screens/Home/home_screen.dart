import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/product_provider.dart';
import 'package:foodapp/screens/products/product_widgets/herbs_product.dart';
import 'package:foodapp/screens/reviewCart/review_cart.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../products/product_widgets/fresh_product.dart';
import '../products/product_widgets/root_product.dart';
import '../search/search_screen.dart';
import 'drawer_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider allProductItem;
  late bool isLoading;

  @override
  void initState() {
    allProductItem = Provider.of<ProductProvider>(context, listen: false);
    allProductItem.getAllProductItem;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userDetails = Provider.of<UserProvider>(context);
    userDetails.getUserData();
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
        backgroundColor: AppColors.appprimaryColor,
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchPage(
                      searchData: allProductItem.getAllProductItem,
                    ))),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ReviewCart(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerSide(
        userData: userDetails,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
