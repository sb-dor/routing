import 'package:routing/go_router_src/features/cart/data/cart_datasource.dart';
import 'package:routing/go_router_src/features/product/models/product_gr.dart';

abstract interface class ICartRepository {
  Future<void> saveProduct(String id, double qty);

  Future<Map<ProductGr, double>> savedProducts();
}

final class CartRepositoryImpl implements ICartRepository {
  CartRepositoryImpl(this._iCartDatasource);

  final ICartDatasource _iCartDatasource;

  @override
  Future<void> saveProduct(String id, double qty) => _iCartDatasource.saveProduct(id, qty);

  @override
  Future<Map<ProductGr, double>> savedProducts() => _iCartDatasource.savedProducts();
}
