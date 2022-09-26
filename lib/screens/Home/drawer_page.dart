import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/user_provider.dart';
import 'package:foodapp/screens/Home/home_screen.dart';
import 'package:foodapp/screens/userProfile/user_profile.dart';
import 'package:provider/provider.dart';

import '../reviewCart/review_cart.dart';

class DrawerSide extends StatefulWidget {
  const DrawerSide({super.key});

  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
//todo: ListTile is here..
  Widget listTile(
      {String? title,
      IconData? iconData,
      required Function? Function() onTap}) {
    return SizedBox(
      height: 50,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          size: 28,
        ),
        title: Text(
          title!,
          style: TextStyle(color: AppColors.textColor),
        ),
      ),
    );
  }

  //! Getting userDetails Declare...
  late UserProvider userProvider;

  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.userDetails();
    print("Length = > ${userProvider.getUserDataDetails.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);

    return Drawer(
      child: Container(
        color: Colors.white,
        child: Consumer(
          builder: (context, userData, child) => Column(
            children: [
              DrawerHeader(
                child: Row(
                    children: userProvider.getUserDataDetails.map((e) {
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 43,
                        backgroundColor: Colors.white54,
                        child: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          backgroundImage: NetworkImage(
                            e.userIamge,
                          ),
                          radius: 40,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            e.userName.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            e.userEmail.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }).toList()),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        listTile(
                          iconData: Icons.home_outlined,
                          title: "Home",
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                            return null;
                          },
                        ),
                        listTile(
                          iconData: Icons.shop_outlined,
                          title: "Review Cart",
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ReviewCart(),
                              ),
                            );
                            return null;
                          },
                        ),
                        Consumer<UserProvider>(
                          builder: (context, value, child) => listTile(
                            iconData: Icons.person_outlined,
                            title: "My Profile",
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const UserProfile(
                                    userEmail: "",
                                    userIamge: '',
                                    userName: '',
                                    userUid: '',
                                  ),
                                ),
                              );
                              return null;
                            },
                          ),
                        ),
                        listTile(
                            onTap: (() {
                              return null;
                            }),
                            iconData: Icons.notifications_outlined,
                            title: "Notificatio"),
                        listTile(
                          iconData: Icons.star_outline,
                          title: "Rating & Review",
                          onTap: (() {
                            return null;
                          }),
                        ),
                        listTile(
                            iconData: Icons.favorite_outline,
                            title: "Wishlist",
                            onTap: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => ,
                              //   ),
                              // );
                              return null;
                            }),
                        listTile(
                          iconData: Icons.copy_outlined,
                          title: "Raise a Complaint",
                          onTap: (() {
                            return null;
                          }),
                        ),
                        listTile(
                          iconData: Icons.format_quote_outlined,
                          title: "FAQs",
                          onTap: (() {
                            return null;
                          }),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            height: 2,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          height: 150,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Contact Support"),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: const [
                                    Text("Mail us:"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "sp@gmail.com",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
