import 'package:routing/go_router_src/features/cart/controller/cart_controller.dart';
import 'package:routing/go_router_src/features/cart/data/cart_datasource.dart';
import 'package:routing/go_router_src/features/cart/data/cart_repository.dart';
import 'package:routing/go_router_src/features/category/controller/category_gr_controller.dart';
import 'package:routing/go_router_src/features/category/data/category_gr_datasource.dart';
import 'package:routing/go_router_src/features/category/data/category_gr_repository.dart';
import 'package:routing/go_router_src/features/product/controller/product_gr_controller.dart';
import 'package:routing/go_router_src/features/product/data/product_gr_datasource.dart';
import 'package:routing/go_router_src/features/product/data/product_gr_repository.dart';
import 'package:routing/octopus_src/common/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

ProductGrController productGrController() {
  final IProductGrDatasource datasource = ProductGrDatasourceImpl();
  final IProductGrRepository repository = ProductGrRepositoryImpl(datasource);
  return ProductGrController(repository);
}

CategoryGrController categoryGrController() {
  final ICategoryGrDatasource datasource = CategoryGrDatasourceImpl();
  final ICategoryGrRepository repository = CategoryGrRepositoryImpl(datasource);
  return CategoryGrController(repository);
}

CartController cartController(SharedPreferences sharedPrefer) {
  final ICartDatasource datasource = CartDatasourceImpl(
    SharedPreferencesHelper(sharedPrefer),
  );
  final ICartRepository repository = CartRepositoryImpl(datasource);
  return CartController(repository);
}
