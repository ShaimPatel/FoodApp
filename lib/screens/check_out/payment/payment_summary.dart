// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodapp/Models/delivery_address_model.dart';
import 'package:foodapp/screens/Home/home_screen.dart';
import 'package:foodapp/screens/check_out/payment/mygoogle_pay.dart';

import 'package:foodapp/screens/check_out/payment/order_item.dart';

import '../../../config/colors.dart';

// ignore: must_be_immutable
class PaymentSummary extends StatefulWidget {
  DeliveryAddresModel addressList;

  PaymentSummary({
    Key? key,
    required this.addressList,
  }) : super(key: key);

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

enum AddressTypes { upi, home, netBanking }

class _PaymentSummaryState extends State<PaymentSummary> {
  var type = AddressTypes.upi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ListTile(
          title: const Text("Total amount"),
          subtitle: Text(
            "\$ 100",
            style: TextStyle(color: AppColors.appprimaryColor),
          ),
          trailing: SizedBox(
            width: 170,
            height: 45,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                type == AddressTypes.home
                    ? Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()))
                    : Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyGooglePay()));
              },
              child: Text("Place order".toUpperCase()),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: AppColors.appprimaryColor,
          title: const Text(
            "Payment Summary",
          ),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                  "${widget.addressList.firstName.toString()} ${widget.addressList.lastName.toString()}"),
                              subtitle: Text(
                                "aera, ${widget.addressList.area}, street, ${widget.addressList.street}, society ${widget.addressList.society}, pincode ${widget.addressList.pincode}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ))),
              ),
              const Divider(height: 2, color: Colors.black),
              const ExpansionTile(
                title: Text("Toatl item"),
                children: [
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                ],
              ),
              const Divider(height: 5),
              const ListTile(
                minVerticalPadding: 5,
                leading: Text(
                  "Sub Toatal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  "\$20",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 5,
                leading: Text(
                  "Shapping Charge",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: Text(
                  "\$2",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 5,
                leading: Text(
                  "Discount Offer",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: Text(
                  "\$1",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 5,
                leading: Text(
                  "Discount Offer",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: Text(
                  "\$1",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 9),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 2,
                  color: Colors.black,
                ),
              ),
              ExpansionTile(
                collapsedIconColor: Colors.grey,
                collapsedTextColor: Colors.grey,
                textColor: Colors.black38,
                leading: const Text(
                  "Payment method*",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                title: const Text(""),
                children: [
                  RadioListTile(
                    value: AddressTypes.upi,
                    groupValue: type,
                    onChanged: (AddressTypes? addressHome) {
                      setState(() {
                        type = addressHome!;
                      });
                    },
                    title: const Text("UPI"),
                    activeColor: Colors.green,
                    secondary: const Icon(
                      Icons.payment,
                      color: Colors.black,
                    ),
                  ),
                  RadioListTile(
                    value: AddressTypes.home,
                    activeColor: Colors.green,
                    groupValue: type,
                    onChanged: (AddressTypes? addressOffice) {
                      setState(() {
                        type = addressOffice!;
                      });
                    },
                    title: const Text("Cash on Delivery"),
                    secondary: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                  ),
                  RadioListTile(
                    activeColor: Colors.green,
                    value: AddressTypes.netBanking,
                    groupValue: type,
                    onChanged: (AddressTypes? asd) {
                      setState(() {
                        type = asd!;
                        print(type);
                      });
                    },
                    title: const Text("Net Banking"),
                    secondary: const Icon(
                      Icons.online_prediction,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ]);
          },
        ));
  }
}
