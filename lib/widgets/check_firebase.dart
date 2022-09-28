// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:foodapp/screens/Home/single_product.dart';

// class CheckFirebase extends StatefulWidget {
//   const CheckFirebase({super.key});

//   @override
//   State<CheckFirebase> createState() => _CheckFirebaseState();
// }

// class _CheckFirebaseState extends State<CheckFirebase> {
//   Future<void> uploadingData(
//       String productName, String productPrice, String imageUrl) async {
//     await FirebaseFirestore.instance.collection("HerbsProducts").add({
//       'productName': productName,
//       'productPrice': productPrice,
//       'productImage': imageUrl,
//     });
//   }

//   @override
//   void initState() {
//     uploadingData("productName", "90",
//         "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60");
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: ElevatedButton(
//               onPressed: () {},
//               child: const Text("Check"),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               child: getData(),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   StreamBuilder<QuerySnapshot<Map<String, dynamic>>> getData() {
//     return StreamBuilder(
//         stream:
//             FirebaseFirestore.instance.collection("HerbsProducts").snapshots(),
//         builder: (context, snapshot) {
//           return !snapshot.hasData
//               ? const Text('PLease Wait')
//               : ListView.builder(
//                   itemCount: snapshot.data?.docs.length,
//                   itemBuilder: (context, index) {
//                     QueryDocumentSnapshot<Map<String, dynamic>>? products =
//                         snapshot.data?.docs[index];
//                     return SingleProduct(
//                       productImage: products!['productImage'],
//                       productName: products['productName'],
//                       onClick: () {},
//                       productId: '',
//                       productUnit: const [],
//                     );
//                   },
//                 );
//         });
//   }
// }
