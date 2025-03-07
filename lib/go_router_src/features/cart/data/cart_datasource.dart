import 'dart:convert';

import 'package:routing/go_router_src/features/cart/models/cart_gr.dart';
import 'package:routing/go_router_src/features/product/models/product_gr.dart';
import 'package:routing/octopus_src/common/shared_preferences_helper/shared_preferences_helper.dart';

abstract interface class ICartDatasource {
  Future<void> saveProduct(List<CartGr> cart);

  Future<Map<ProductGr, double>> savedProducts();
}

final class CartDatasourceImpl implements ICartDatasource {
  CartDatasourceImpl(this._sharedPreferencesHelper);

  final SharedPreferencesHelper _sharedPreferencesHelper;

  final String _cartKey = 'cart';

  @override
  Future<void> saveProduct(List<CartGr> cart) async {
    await _sharedPreferencesHelper.deleteString(_cartKey);
    await _sharedPreferencesHelper.saveString(
      _cartKey,
      jsonEncode(
        cart
            .map(
              (element) => {
                "id": element.productGr.id,
                "price": element.price,
                "name": element.productGr.name,
                "qty": element.qty,
              },
            )
            .toList(),
      ),
    );
  }

  @override
  Future<Map<ProductGr, double>> savedProducts() async {
    final savedProducts = _sharedPreferencesHelper.getString(_cartKey) ?? '';
    if (savedProducts.isNotEmpty) {
      final decodeProducts = jsonDecode(savedProducts) as List;
      final Map<ProductGr, double> result = {};
      for (final each in decodeProducts) {
        result[ProductGr(
              id: each['id'],
              name: each['name'],
              price: each['price'],
            )] =
            each['qty'];
      }
      return result;
    }
    return <ProductGr, double>{};
  }
}
