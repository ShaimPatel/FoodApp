// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/user_provider.dart';
import 'package:foodapp/screens/Home/home_screen.dart';
import 'package:foodapp/screens/userProfile/user_profile.dart';
import 'package:foodapp/screens/wishlist/wish_list.dart';

import '../reviewCart/review_cart.dart';

// ignore: must_be_immutable
class DrawerSide extends StatefulWidget {
  UserProvider userData;
  DrawerSide({
    Key? key,
    required this.userData,
  }) : super(key: key);

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

  // //! Getting userDetails Declare...
  // late UserProvider userProvider;

  // @override
  // void initState() {
  //   userProvider = Provider.of<UserProvider>(context, listen: false);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // userProvider = Provider.of<UserProvider>(context);

    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              child: Row(children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white54,
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow,
                        backgroundImage: NetworkImage(
                          widget.userData.currentData!.userIamge,
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
                          widget.userData.currentData!.userName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.userData.currentData!.userEmail,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ]),
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
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ReviewCart(),
                            ),
                          );
                          return null;
                        },
                      ),
                      listTile(
                        iconData: Icons.person_outlined,
                        title: "My Profile",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserProfile(userData: widget.userData),
                            ),
                          );
                          return null;
                        },
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const WishListPage(),
                              ),
                            );
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
    );
  }
}
