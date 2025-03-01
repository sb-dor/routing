import 'product_gr_datasource.dart';

abstract interface class IProductGrRepository {}

final class ProductGrRepositoryImpl implements IProductGrRepository {
  ProductGrRepositoryImpl(this._iProductGrDatasource);

  final IProductGrDatasource _iProductGrDatasource;
}
