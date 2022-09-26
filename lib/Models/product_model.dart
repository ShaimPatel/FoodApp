class ProductModel {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;

  ProductModel(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice});

  // Map<String, dynamic> createMap() {
  //   return {
  //     'productName': productName,
  //     'productImage': productImage,
  //     'productPrice': productPrice
  //   };
  // }

  // ProductModel.fromFirestore(Map<String, dynamic> firestoreMap)
  //     : productName = firestoreMap['productName'],
  //       productImage = firestoreMap['productImage'],
  //       productPrice = firestoreMap['productPrice'];
}
