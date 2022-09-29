import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/screens/check_out/google_map/google_map.dart';
import 'package:provider/provider.dart';

import '../../../providers/add_address_provider.dart';
import '../../../widgets/custom_textfields.dart';

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({super.key});

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum AddressTypes { home, office, other }

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var type = AddressTypes.home;
  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    var address = Provider.of<AddAddressProvider>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        width: 160,
        height: 50,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: address.isLoading == false
            ? ElevatedButton(
                onPressed: () {
                  address.validator(context, type.name);
                  address.isLoading == false;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appprimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                child: const Text(
                  "Add Address",
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.appprimaryColor,
        title: const Text("Add address"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CusstomTextFeilds(
              obscuretext: false,
              icon: const Icon(Icons.person),
              controller: address.firstName,
              hinttext: 'First name',
              keyboardtype: TextInputType.text,
              labeltext: 'First Name',
            ),
            CusstomTextFeilds(
              obscuretext: false,
              icon: const Icon(Icons.person),
              controller: address.secondName,
              hinttext: 'Last name',
              keyboardtype: TextInputType.text,
              labeltext: 'Last Name',
            ),
            CusstomTextFeilds(
              obscuretext: false,
              icon: const Icon(Icons.mobile_friendly_outlined),
              controller: address.mobileNumber,
              hinttext: 'Mobile Number',
              keyboardtype: TextInputType.number,
              labeltext: 'Mobile',
            ),
            CusstomTextFeilds(
              obscuretext: false,
              icon: const Icon(Icons.mobile_friendly_outlined),
              controller: address.alternetMobileNumber,
              hinttext: 'Alternate Mobile number',
              keyboardtype: TextInputType.number,
              labeltext: 'Alternate mobile',
            ),
            CusstomTextFeilds(
              obscuretext: false,
              icon: const Icon(Icons.house_rounded),
              controller: address.society,
              hinttext: 'society',
              keyboardtype: TextInputType.text,
              labeltext: 'society',
            ),
            CusstomTextFeilds(
              obscuretext: false,
              icon: const Icon(Icons.streetview),
              controller: address.street,
              hinttext: 'Street',
              keyboardtype: TextInputType.text,
              labeltext: 'Street',
            ),
            CusstomTextFeilds(
              obscuretext: false,
              icon: const Icon(Icons.landscape_rounded),
              controller: address.landMark,
              hinttext: 'Landmark',
              keyboardtype: TextInputType.text,
              labeltext: 'Landmark',
            ),
            CusstomTextFeilds(
              obscuretext: false,
              icon: const Icon(Icons.location_city_rounded),
              controller: address.city,
              hinttext: 'City',
              keyboardtype: TextInputType.text,
              labeltext: 'City',
            ),
            CusstomTextFeilds(
              obscuretext: false,
              icon: const Icon(Icons.person),
              controller: address.area,
              hinttext: 'Area',
              keyboardtype: TextInputType.text,
              labeltext: 'Area',
            ),
            CusstomTextFeilds(
              obscuretext: false,
              icon: const Icon(Icons.pin),
              controller: address.pincode,
              hinttext: 'Pincode',
              keyboardtype: TextInputType.number,
              labeltext: 'Pincode',
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const GoogleMapScreen()));
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[600]!),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    Icon(
                      Icons.location_on,
                      color: Colors.grey[600]!,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Set Location",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10)),
              child: ExpansionTile(
                collapsedIconColor: Colors.grey,
                collapsedTextColor: Colors.grey,
                textColor: Colors.black38,
                title: const Text(
                  "Addres Type*",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black54),
                ),
                leading: const Icon(
                  Icons.place_outlined,
                  color: Colors.black54,
                ),
                children: [
                  RadioListTile(
                    value: AddressTypes.home,
                    groupValue: type,
                    onChanged: (AddressTypes? addressHome) {
                      setState(() {
                        type = addressHome!;
                      });
                    },
                    title: const Text("Home"),
                    activeColor: Colors.green,
                    secondary: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                  ),
                  RadioListTile(
                    value: AddressTypes.office,
                    activeColor: Colors.green,
                    groupValue: type,
                    onChanged: (AddressTypes? addressOffice) {
                      setState(() {
                        type = addressOffice!;
                      });
                    },
                    title: const Text("Office"),
                    secondary: const Icon(
                      Icons.work,
                      color: Colors.black,
                    ),
                  ),
                  RadioListTile(
                    activeColor: Colors.green,
                    value: AddressTypes.other,
                    groupValue: type,
                    onChanged: (AddressTypes? asd) {
                      setState(() {
                        type = asd!;
                      });
                    },
                    title: const Text("Other"),
                    secondary: const Icon(
                      Icons.other_houses,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
