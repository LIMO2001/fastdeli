import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C H E C K O U T"),
      ),
    );
  }
}
 void main() {
  // Simulating a product checkout
  double totalPrice = 49.99;
  String productName = "Awesome Widget";

  // Print information after checkout
  print ("Thank you for purchasing $productName!");
  print("Your total price is \$$totalPrice.");

  // You can add more details or customize the output as needed.
}
