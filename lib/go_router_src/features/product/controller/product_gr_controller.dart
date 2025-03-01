import 'package:flutter/foundation.dart';
import 'package:routing/go_router_src/features/product/data/product_gr_repository.dart';
import 'package:routing/go_router_src/features/product/models/product_gr.dart';

final class ProductGrController with ChangeNotifier {
  ProductGrController(this._iProductGrRepository);

  final IProductGrRepository _iProductGrRepository;

  final List<ProductGr> products = [];

  void fetchProducts(String categoryId) async {
    products.clear();
    products.addAll(await _iProductGrRepository.products(categoryId));
    notifyListeners();
  }
}
