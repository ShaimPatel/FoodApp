import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class MyGooglePay extends StatefulWidget {
  const MyGooglePay({super.key});

  @override
  State<MyGooglePay> createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {
  void onGooglePayResult(paymentResult) {
    print(paymentResult);
  }

  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      height: RawGooglePayButton.minimumButtonWidth,
      width: RawGooglePayButton.minimumButtonWidth,
      onError: (error) => print("Error"),
      onPaymentResult: (Map<String, dynamic> result) {
        onGooglePayResult(result);
      },
      paymentConfigurationAsset: 'sample_payment_configuration.json',
      paymentItems: const [
        PaymentItem(
          label: 'Total',
          amount: '99.99',
          status: PaymentItemStatus.final_price,
          type: PaymentItemType.item,
        )
      ],
      type: GooglePayButtonType.subscribe,

      onPressed: () {
        print("Pressed");
      },
      // loadingIndicator: const CircularProgressIndicator(),
    );
  }
}
