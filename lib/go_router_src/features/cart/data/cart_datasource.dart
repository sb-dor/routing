import 'package:routing/go_router_src/features/product/models/product_gr.dart';

abstract interface class ICartDatasource {
  Future<void> saveProduct(String id, double qty);

  Future<Map<ProductGr, double>> savedProducts();
}

final class CartDatasourceImpl implements ICartDatasource {
  @override
  Future<void> saveProduct(String id, double qty) {
    // TODO: implement saveProduct
    throw UnimplementedError();
  }

  @override
  Future<Map<ProductGr, double>> savedProducts() {
    // TODO: implement savedProducts
    throw UnimplementedError();
  }
}
