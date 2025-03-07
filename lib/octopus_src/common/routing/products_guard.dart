// final class ProductsGuard extends OctopusGuard {
//   static final String _productsName = AppRoute.product.name;
//
//   @override
//   FutureOr<OctopusState> call(
//     List<OctopusHistoryEntry> history,
//     OctopusState$Mutable state,
//     Map<String, Object?> context,
//   ) {
//     if (context.containsKey('user') && context['user'] == null) return state;
//   }
//
//   OctopusState _fix(OctopusState$Mutable state) {
//     return state..clear()..putIfAbsent(_productsName, )
//   }
// }
