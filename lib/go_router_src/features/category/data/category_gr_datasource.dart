import 'package:routing/go_router_src/features/category/models/category_gr.dart';
import 'package:routing/go_router_src/common/utils/gr_constants.dart'
    as grconstants;

abstract interface class ICategoryGrDatasource {
  Future<List<CategoryGr>> categories();
}

final class CategoryGrDatasourceImpl implements ICategoryGrDatasource {
  @override
  Future<List<CategoryGr>> categories() async {
    return grconstants.categories;
  }
}
