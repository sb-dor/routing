import 'package:routing/go_router_src/features/product/models/product_gr.dart';

final class CartGr {
  final ProductGr productGr;
  final double price;
  double qty;

  CartGr({
    required this.productGr,
    required this.price,
    required this.qty,
  });
}
