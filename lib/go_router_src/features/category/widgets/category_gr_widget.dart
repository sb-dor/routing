import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:routing/go_router_src/features/category/controller/category_gr_controller.dart';

class CategoryGrWidget extends StatefulWidget {
  const CategoryGrWidget({super.key});

  @override
  State<CategoryGrWidget> createState() => _CategoryGrWidgetState();
}

class _CategoryGrWidgetState extends State<CategoryGrWidget> {
  late final CategoryGrController _categoryGrController;

  @override
  void initState() {
    super.initState();
    _categoryGrController = context.read<CategoryGrController>();
    _categoryGrController.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: ListenableBuilder(
        listenable: _categoryGrController,
        builder: (context, child) {
          return ListView.builder(
            itemCount: _categoryGrController.categories.length,
            itemBuilder: (context, index) {
              final category = _categoryGrController.categories[index];
              return ListTile(
                title: Text(category.name),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  context.go(
                    '/categories/products?categoryId=${_categoryGrController.categories[index].id}',
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
