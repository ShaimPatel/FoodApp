import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';

class UserProfile extends StatelessWidget {
  final String userName;
  final String userIamge;
  final String userEmail;
  final String userUid;
  const UserProfile(
      {super.key,
      required this.userName,
      required this.userIamge,
      required this.userEmail,
      required this.userUid});

  @override
  Widget build(BuildContext context) {
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
                                      "Shivam Patel",
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
                                      "sp@gmail.com",
                                      style: TextStyle(
                                        fontSize: 12,
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
                  backgroundImage: const NetworkImage(
                    "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
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
