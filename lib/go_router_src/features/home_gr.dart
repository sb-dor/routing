import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:routing/go_router_src/features/cart/controller/cart_controller.dart';

// https://www.youtube.com/watch?v=b6Z885Z46cU
class HomeGr extends StatefulWidget {
  const HomeGr({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<HomeGr> createState() => _HomeGrState();
}

class _HomeGrState extends State<HomeGr> {
  int _index = 0;
  final List<String> _routes = [
    '/categories',
    '/cart',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          context.go(_routes[index]);
          setState(() {
            _index = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Categories",
            icon: Icon(
              Icons.route,
              color: _index == 0 ? Colors.orange : null,
            ),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Badge(
              label: Text(
                context.watch<CartController>().cartItems.length.toString(),
              ),
              isLabelVisible: context.watch<CartController>().cartItems.isNotEmpty,
              child: Icon(
                Icons.route,
                color: _index == 1 ? Colors.orange : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
