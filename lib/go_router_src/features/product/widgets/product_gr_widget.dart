import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/go_router_src/features/cart/controller/cart_controller.dart';
import 'package:routing/go_router_src/features/init/logic/gr_factories.dart';
import 'package:routing/go_router_src/features/product/controller/product_gr_controller.dart';

class ProductGrWidget extends StatefulWidget {
  const ProductGrWidget({super.key, required this.categoryId});

  final String categoryId;

  @override
  State<ProductGrWidget> createState() => _ProductGrWidgetState();
}

class _ProductGrWidgetState extends State<ProductGrWidget> {
  late final ProductGrController _productGrController;

  @override
  void initState() {
    super.initState();
    _productGrController = productGrController();
    _productGrController.fetchProducts(widget.categoryId);
  }

  @override
  void dispose() {
    _productGrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0.0,
        title: Text("Products"),
      ),
      body: ListenableBuilder(
        listenable: _productGrController,
        builder: (context, child) {
          return ListView.builder(
            itemCount: _productGrController.products.length,
            itemBuilder: (context, index) {
              final product = _productGrController.products[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                  trailing: ElevatedButton(
                    onPressed: () {
                      context.read<CartController>().addProduct(product);
                    },
                    child: const Text("Add to Cart"),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
