import 'package:flutter/foundation.dart';
import 'package:routing/go_router_src/features/cart/data/cart_repository.dart';

final class CartController with ChangeNotifier {
  CartController(this._iCartRepository);

  final ICartRepository _iCartRepository;
}
