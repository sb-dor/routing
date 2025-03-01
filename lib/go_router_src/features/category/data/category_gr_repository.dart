import 'package:routing/go_router_src/features/category/data/category_gr_datasource.dart';
import 'package:routing/go_router_src/features/category/models/category_gr.dart';

abstract interface class ICategoryGrRepository {
  Future<List<CategoryGr>> categories();
}

final class CategoryGrRepositoryImpl implements ICategoryGrRepository {
  CategoryGrRepositoryImpl(this._iCategoryGrDatasource);

  final ICategoryGrDatasource _iCategoryGrDatasource;

  @override
  Future<List<CategoryGr>> categories() => _iCategoryGrDatasource.categories();
}
