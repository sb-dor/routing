import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          items: _routes
              .mapIndexed(
                (mapIndex, element) => BottomNavigationBarItem(
                  label: element,
                  icon: Icon(Icons.route, color: mapIndex == _index ? Colors.orange : null),
                ),
              )
              .toList()),
    );
  }
}
