import 'package:flutter/foundation.dart';
import 'package:routing/go_router_src/features/category/data/category_gr_repository.dart';
import 'package:routing/go_router_src/features/category/models/category_gr.dart';

final class CategoryGrController with ChangeNotifier {
  CategoryGrController(this._iCategoryGrRepository);

  final ICategoryGrRepository _iCategoryGrRepository;

  final List<CategoryGr> categories = [];

  void fetchCategories() async {
    categories.clear();
    categories.addAll(await _iCategoryGrRepository.categories());
    notifyListeners();
  }
}
