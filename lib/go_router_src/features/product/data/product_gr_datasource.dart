import 'package:collection/collection.dart';
import 'package:routing/go_router_src/common/utils/gr_constants.dart';
import 'package:routing/go_router_src/features/product/models/product_gr.dart';

abstract interface class IProductGrDatasource {
  Future<List<ProductGr>> products(String categoryId);
}

final class ProductGrDatasourceImpl implements IProductGrDatasource {
  @override
  Future<List<ProductGr>> products(String categoryId) async {
    return categories
            .firstWhereOrNull((category) => category.id == categoryId)
            ?.products ??
        <ProductGr>[];
  }
}
