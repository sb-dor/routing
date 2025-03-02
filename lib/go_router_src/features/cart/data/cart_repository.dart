import 'package:routing/go_router_src/features/cart/data/cart_datasource.dart';
import 'package:routing/go_router_src/features/cart/models/cart_gr.dart';
import 'package:routing/go_router_src/features/product/models/product_gr.dart';

abstract interface class ICartRepository {
  Future<void> saveProduct(List<CartGr> cart);

  Future<Map<ProductGr, double>> savedProducts();
}

final class CartRepositoryImpl implements ICartRepository {
  CartRepositoryImpl(this._iCartDatasource);

  final ICartDatasource _iCartDatasource;

  @override
  Future<void> saveProduct(List<CartGr> cart) => _iCartDatasource.saveProduct(cart);

  @override
  Future<Map<ProductGr, double>> savedProducts() => _iCartDatasource.savedProducts();
}
