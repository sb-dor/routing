import 'package:flutter/foundation.dart';
import 'package:routing/go_router_src/features/product/data/product_gr_repository.dart';

final class ProductGrController with ChangeNotifier {
  ProductGrController(this._iProductGrRepository);

  final IProductGrRepository _iProductGrRepository;
}
