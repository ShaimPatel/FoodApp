// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/user_provider.dart';

// ignore: must_be_immutable
class UserProfile extends StatefulWidget {
  UserProvider userData;
  UserProfile({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  //? ListTile
  Widget listTile({required IconData leadingIcon, required String title}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(leadingIcon),
          title: Text(title),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var userInforData = widget.userData.currentUserData;

    return Scaffold(
      backgroundColor: AppColors.appprimaryColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              height: 30,
              width: 30,
              child: const Icon(
                Icons.close,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.appprimaryColor,
        elevation: 0.0,
        title: const Text("User Profile"),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: AppColors.appprimaryColor,
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  // height: 548,
                  width: double.infinity,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            // color: Colors.pink,
                            width: 250,
                            height: 80,
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userInforData.userName,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      userInforData.userEmail,
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.appprimaryColor,
                                    radius: 20,
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      listTile(
                          leadingIcon: Icons.shopping_bag_outlined,
                          title: "My Orders"),
                      listTile(leadingIcon: Icons.person, title: "My Orders"),
                      listTile(
                          leadingIcon: Icons.location_on,
                          title: "My Delivery Address"),
                      listTile(
                          leadingIcon: Icons.person, title: "Refer A Friends"),
                      listTile(
                          leadingIcon: Icons.file_copy,
                          title: "Terms & condition"),
                      listTile(
                          leadingIcon: Icons.policy_outlined,
                          title: "Privacy Policy"),
                      listTile(
                          leadingIcon: Icons.logout,
                          title: "Logout".toUpperCase()),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.appprimaryColor,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    userInforData.userIamge,
                  ),
                  radius: 45,
                  backgroundColor: AppColors.scaffoldBackgroundColor,
                )),
          ),
        ],
      ),
    );
  }
}
