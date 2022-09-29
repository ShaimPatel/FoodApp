import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/add_address_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final LatLng _initialcameraposition = const LatLng(26.8467, 80.9462);
  late GoogleMapController _controller;
  final Location _location = Location();

  void _onMapCreated(GoogleMapController cntlr) {
    _controller = cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  String api = "AIzaSyD1T_Pc5AY47I8TK1enyNa3w3CK7yq1QJE";
  @override
  Widget build(BuildContext context) {
    final addAddress = Provider.of<AddAddressProvider>(context);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.only(
                    right: 60, left: 10, bottom: 40, top: 40),
                child: ElevatedButton(
                  onPressed: () async {
                    await _location.getLocation().then((value) {
                      setState(() {
                        addAddress.setLocation = value;
                      });
                      Navigator.of(context).pop();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: AppColors.appprimaryColor),
                  child: const Text("Set Location"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
