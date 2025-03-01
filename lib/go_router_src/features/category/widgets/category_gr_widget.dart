import 'package:flutter/material.dart';

class CategoryGrWidget extends StatefulWidget {
  const CategoryGrWidget({super.key});

  @override
  State<CategoryGrWidget> createState() => _CategoryGrWidgetState();
}

class _CategoryGrWidgetState extends State<CategoryGrWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
    );
  }
}
