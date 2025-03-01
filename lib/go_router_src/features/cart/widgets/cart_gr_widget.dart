import 'package:flutter/material.dart';

class CartGrWidget extends StatefulWidget {
  const CartGrWidget({super.key});

  @override
  State<CartGrWidget> createState() => _CartGrWidgetState();
}

class _CartGrWidgetState extends State<CartGrWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
    );
  }
}
