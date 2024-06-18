import 'package:fastdeli/checkout.dart';
import 'package:fastdeli/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  // User wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //only show dialog of the form is valid
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Confirm Payment'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text("Card Number: $cardNumber"),
                      Text("Exipiry Date: $expiryDate"),
                      Text("Card Holder Name: $cardHolderName"),
                      Text("cvvCode: $cvvCode"),
                    ],
                  ),
                ),
                actions: [
                  //cancel Button
                  TextButton(
                      onPressed: () => Navigator.pop,
                      child: const Text('Cancel')),

                  //Yes Button
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Checkout())),
                      child: const Text('Yes'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(left: 45),
          child: Text("C H E C K O U T"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Credit Card
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),

          // Credit Card Form
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
            formKey: formKey,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: MyButton(text:'PAY NOW ', onTap:userTappedPay,),
          )
        ],
      ),
    );
  }
}
