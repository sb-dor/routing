import 'package:routing/go_router_src/features/category/models/category_gr.dart';
import 'package:routing/go_router_src/features/product/models/product_gr.dart';

final List<CategoryGr> categories = [
  CategoryGr(
    id: "1",
    name: "Electronics",
    products: [
      ProductGr(id: "1", name: "Laptop", price: 999.99),
      ProductGr(id: "2", name: "Smartphone", price: 799.99),
    ],
  ),
  CategoryGr(
    id: "2",
    name: "Clothing",
    products: [
      ProductGr(id: "3", name: "T-Shirt", price: 19.99),
      ProductGr(id: "4", name: "Jeans", price: 49.99),
    ],
  ),
  CategoryGr(
    id: "3",
    name: "Groceries",
    products: [
      ProductGr(id: "5", name: "Milk", price: 2.99),
      ProductGr(id: "6", name: "Bread", price: 1.99),
    ],
  ),
];
