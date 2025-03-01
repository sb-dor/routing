import 'package:flutter/foundation.dart';
import 'package:routing/go_router_src/features/category/data/category_gr_repository.dart';

final class CategoryGrController with ChangeNotifier {
  CategoryGrController(this._iCategoryGrRepository);

  final ICategoryGrRepository _iCategoryGrRepository;
}
