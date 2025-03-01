import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/go_router_src/features/cart/controller/cart_controller.dart';

class CartGrWidget extends StatefulWidget {
  const CartGrWidget({super.key});

  @override
  State<CartGrWidget> createState() => _CartGrWidgetState();
}

class _CartGrWidgetState extends State<CartGrWidget> {
  late final CartController _cartController;

  @override
  void initState() {
    super.initState();
    _cartController = context.read<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListenableBuilder(
        listenable: _cartController,
        builder: (context, child) {
          return ListView.builder(
            itemCount: _cartController.cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = _cartController.cartItems[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(
                    cartItem.productGr.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("Price: \$${cartItem.price.toStringAsFixed(2)}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          _cartController.removeProduct(cartItem);
                        },
                      ),
                      Text(
                        cartItem.qty.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          _cartController.addProduct(cartItem.productGr);
                        },
                      ),
                    ],
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
