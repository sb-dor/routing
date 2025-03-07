import 'package:routing/go_router_src/features/product/models/product_gr.dart';

final class CategoryGr {
  final String id;
  final String name;
  final List<ProductGr> products;

  CategoryGr({required this.id, required this.name, required this.products});
}
