import 'package:flutter/material.dart';

class ProductGrWidget extends StatefulWidget {
  const ProductGrWidget({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  State<ProductGrWidget> createState() => _ProductGrWidgetState();
}

class _ProductGrWidgetState extends State<ProductGrWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
    );
  }
}
