import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/add_address_provider.dart';
import 'package:foodapp/screens/check_out/delivery_address/add_delivery_address.dart';
import 'package:foodapp/screens/check_out/payment/payment_summary.dart';
import 'package:provider/provider.dart';

import '../single_delivery_item.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({super.key});

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  var getAddress;
  var getData;

  @override
  Widget build(BuildContext context) {
    getAddress = Provider.of<AddAddressProvider>(context, listen: true);
    getData = getAddress.fechDeliveryAddress();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.appprimaryColor,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PaymentSummary()));
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
                  builder: (context) => const AddDeliveryAddress()));
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
            child: const Text("Add new address"),
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
            getAddress.getDeliveryAddress.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: getAddress.getDeliveryAddress.map((e) {
                      return SingleDeliveryItem(
                        address:
                            "area ${e.area} , street ${e.street} , society ${e.society} , pincode ${e.pincode}",
                        addressType: "",
                        number: e.mobileNumber,
                        title: "${e.firstName} ${e.lastName}",
                      );
                    }).toList(),
                  ),
          ],
        ));
  }
}
