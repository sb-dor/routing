import 'package:flutter/material.dart';

class ProductWidgets extends StatefulWidget {
  const ProductWidgets({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  State<ProductWidgets> createState() => _ProductWidgetsState();
}

class _ProductWidgetsState extends State<ProductWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product widget: ${widget.productId}"),
      ),
    );
  }
}
