import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:routing/go_router_src/features/cart/data/cart_repository.dart';
import 'package:routing/go_router_src/features/cart/models/cart_gr.dart';
import 'package:routing/go_router_src/features/product/models/product_gr.dart';

final class CartController with ChangeNotifier {
  CartController(this._iCartRepository);

  final ICartRepository _iCartRepository;

  final List<CartGr> cartItems = [];

  void addProduct(ProductGr product) async {
    final findProduct = cartItems.firstWhereOrNull(
      (element) => element.productGr.id == product.id,
    );
    if (findProduct != null) {
      findProduct.qty++;
      await _iCartRepository.saveProduct(cartItems);
    } else {
      final cartItem = CartGr(productGr: product, price: product.price, qty: 1);
      cartItems.add(cartItem);
      await _iCartRepository.saveProduct(cartItems);
    }
    notifyListeners();
  }

  void removeProduct(CartGr cartItem) async {
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
      await _iCartRepository.saveProduct(cartItems);
      notifyListeners();
    }
  }

  void getSavedProducts() async {
    cartItems.clear();
    final savedProducts = await _iCartRepository.savedProducts();
    cartItems.addAll(
      savedProducts.entries
          .map(
            (element) => CartGr(
              productGr: element.key,
              price: element.key.price,
              qty: element.value,
            ),
          )
          .toList(),
    );
    notifyListeners();
  }
}
