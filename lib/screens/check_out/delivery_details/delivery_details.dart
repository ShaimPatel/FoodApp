import 'package:flutter/material.dart';
import 'package:foodapp/Models/delivery_address_model.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/screens/check_out/delivery_address/add_delivery_address.dart';
import 'package:foodapp/screens/check_out/payment/payment_summary.dart';
import 'package:provider/provider.dart';

import '../../../providers/add_address_provider.dart';
import '../single_delivery_item.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({super.key});

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  DeliveryAddresModel? value;
  @override
  Widget build(BuildContext context) {
    AddAddressProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.fechDeliveryAddress();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.appprimaryColor,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddDeliveryAddress()));
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaymentSummary(
                        addressList: value!,
                      )));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appprimaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
            ),
            child: const Text("Payment Summary"),
          ),
        ),
        appBar: AppBar(
          backgroundColor: AppColors.appprimaryColor,
          title: const Text("Delivery Details"),
        ),
        body: ListView(
          children: [
            const ListTile(
                title: Text("Delivery To"),
                leading: Icon(
                  Icons.location_on,
                  size: 30,
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 3,
                color: Colors.white,
              ),
            ),
            SizedBox(
                height: 140,
                width: double.infinity,
                child: deliveryAddressProvider.getDeliveryAddress.isEmpty
                    ? const Center(
                        child: Text("No Data"),
                      )
                    : Column(
                        children: deliveryAddressProvider.getDeliveryAddress
                            .map<Widget>((e) {
                          setState(() {
                            value = e;
                          });
                          return SingleDeliveryItem(
                            address:
                                "aera, ${e.area}, street, ${e.street}, society ${e.society}, pincode ${e.pincode}",
                            title: "${e.firstName} ${e.lastName}",
                            number: e.mobileNumber,
                            addressType: e.addressType == "Home"
                                ? "Home"
                                : e.addressType == "Other"
                                    ? "Other"
                                    : "Work",
                          );
                        }).toList(),
                      ))
          ],
        ));
  }
}
