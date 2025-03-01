import 'package:routing/go_router_src/features/cart/data/cart_datasource.dart';

abstract interface class ICartRepository {}

final class CartRepositoryImpl implements ICartRepository {
  CartRepositoryImpl(this._iCartDatasource);

  final ICartDatasource _iCartDatasource;
}
