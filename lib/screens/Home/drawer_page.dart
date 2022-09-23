import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/screens/Home/home_screen.dart';
import 'package:foodapp/screens/userProfile/user_profile.dart';

class DrawerSide extends StatefulWidget {
  const DrawerSide({super.key});

  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
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
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white54,
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow,
                        backgroundImage: NetworkImage(
                          "https://s3.envato.com/files/328957910/vegi_thumb.png",
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
                      children: const [
                        Text("Shivam"),
                        Text(
                          "sp",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
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
                    builder: (context) => const HomeScreen(),
                  ),
                );
                return null;
              },
            ),
            listTile(
              iconData: Icons.person_outlined,
              title: "My Profile",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UserProfile(),
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
            const SizedBox(height: 25),
            Container(
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Contact Support"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text("Call us:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+91 9616277301"),
                    ],
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
    );
  }
}
