class DeliveryAddresModel {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String alternetMobileNumber;
  final String society;
  final String street;
  final String landmark;
  final String city;
  final String area;
  final String pincode;
  final String? latitude;
  final String? longitude;
  final String? addressType;

  DeliveryAddresModel({
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.alternetMobileNumber,
    required this.society,
    required this.street,
    required this.landmark,
    required this.city,
    required this.area,
    required this.pincode,
    this.latitude,
    this.longitude,
    this.addressType,
  });
}
