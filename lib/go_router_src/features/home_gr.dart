import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:routing/go_router_src/features/cart/controller/cart_controller.dart';

// https://www.youtube.com/watch?v=b6Z885Z46cU
class HomeGr extends StatefulWidget {
  const HomeGr({super.key, required this.statefulNavigationShell});

  final StatefulNavigationShell statefulNavigationShell;

  @override
  State<HomeGr> createState() => _HomeGrState();
}

class _HomeGrState extends State<HomeGr> {
  int _index = 0;
  DateTime? _lastTapTime;

  // final List<String> _routes = [
  //   '/categories',
  //   '/cart',
  // ];

  void _onTap(int index) {
    final now = DateTime.now();

    if (_index == index) {
      if (_lastTapTime != null &&
          now.difference(_lastTapTime!) < const Duration(milliseconds: 300)) {
        _onDoubleTap(index);
        return;
      }
    }

    _lastTapTime = now;

    widget.statefulNavigationShell.goBranch(index);
    setState(() {
      _index = index;
    });
  }

  void _onDoubleTap(int index) {
    widget.statefulNavigationShell.goBranch(index, initialLocation: true);
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.statefulNavigationShell,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Categories",
            icon: Icon(Icons.route, color: _index == 0 ? Colors.orange : null),
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
