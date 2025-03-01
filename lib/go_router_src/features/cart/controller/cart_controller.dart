import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:routing/go_router_src/features/cart/data/cart_repository.dart';
import 'package:routing/go_router_src/features/cart/models/cart_gr.dart';
import 'package:routing/go_router_src/features/product/models/product_gr.dart';

final class CartController with ChangeNotifier {
  CartController(this._iCartRepository);

  final ICartRepository _iCartRepository;

  final List<CartGr> cartItems = [];

  void addProduct(ProductGr product) {
    final findProduct = cartItems.firstWhereOrNull((element) => element.productGr.id == product.id);
    if (findProduct != null) {
      findProduct.qty++;
    } else {
      cartItems.add(
        CartGr(
          productGr: product,
          price: product.price,
          qty: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeProduct(CartGr cartItem) {
    final findItem = cartItems.firstWhereOrNull(
      (element) => element.productGr.id == cartItem.productGr.id,
    );
    if (findItem != null) {
      findItem.qty--;
      if (findItem.qty <= 0.0) {
        cartItems.removeWhere(
          (element) => element.productGr.id == cartItem.productGr.id,
        );
      }
      notifyListeners();
    }
  }
}
