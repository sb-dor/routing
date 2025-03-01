import 'package:routing/go_router_src/features/product/models/product_gr.dart';

import 'product_gr_datasource.dart';

abstract interface class IProductGrRepository {
  Future<List<ProductGr>> products(String categoryId);
}

final class ProductGrRepositoryImpl implements IProductGrRepository {
  ProductGrRepositoryImpl(this._iProductGrDatasource);

  final IProductGrDatasource _iProductGrDatasource;

  @override
  Future<List<ProductGr>> products(String categoryId) => _iProductGrDatasource.products(categoryId);
}
