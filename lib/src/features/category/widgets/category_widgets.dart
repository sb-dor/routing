import 'package:flutter/material.dart';
import 'package:routing/src/features/product/widgets/product_widgets.dart';

class CategoryWidgets extends StatefulWidget {
  const CategoryWidgets({
    super.key,
    required this.category,
  });

  final String category;

  @override
  State<CategoryWidgets> createState() => _CategoryWidgetsState();
}

class _CategoryWidgetsState extends State<CategoryWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category widget: ${widget.category}"),
      ),
      body: CustomScrollView(
        slivers: [
          // sub categories //

          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final subcategoryId = "${widget.category} $index";
              return ListTile(
                title: Text("Sub category: $subcategoryId"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryWidgets(category: subcategoryId),
                    ),
                  );
                },
              );
            },
          ),

          SliverToBoxAdapter(
            child: Divider(),
          ),

          // products //

          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final categoryId = widget.category.hashCode + index;
              return ListTile(
                title: Text("Product: $index"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductWidgets(productId: categoryId),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
