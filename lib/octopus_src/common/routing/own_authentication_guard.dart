import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:octopus/octopus.dart';
import 'package:routing/octopus_src/common/models/user.dart';

/// A router guard that checks if the user is authenticated.
///
/// you can rewrite this logic of checking by your own code here
/// Guard that does not allow to navigate to another route until user authenticates
class OwnAuthenticationGuard extends OctopusGuard {
  OwnAuthenticationGuard({
    required FutureOr<User> Function() getUser,
    required Set<String> guardedRoutes,
    required OctopusState signingNavigation,
    required OctopusState homeNavigation,
    OctopusState? lastNavigation,
    super.refresh,
  })  : _getUser = getUser,
        _guardedRoutes = guardedRoutes,
        _lastNavigation = lastNavigation ?? homeNavigation,
        _signingNavigation = signingNavigation {
    // Get the last navigation from the platform default route.
    if (lastNavigation == null) {
      try {
        final platformDefault = WidgetsBinding.instance.platformDispatcher.defaultRouteName;
        final state = OctopusState.fromLocation(platformDefault);
        if (state.isNotEmpty) {
          _lastNavigation = state;
        }
      } on Object {
        /* ignore */
      }
    }
  }

  /// Get the current user.
  final FutureOr<User> Function() _getUser;

  /// Routes names that stand for the authentication routes.
  final Set<String> _guardedRoutes;

  /// The navigation to use when the user is not authenticated.
  final OctopusState _signingNavigation;

  /// The navigation to use when the user is authenticated.
  OctopusState _lastNavigation;

  // logic works in this way: when you want to navigate to specific route which was added
  // inside guarded routes,
  // first it checks if user authenticated, if he was authenticated he will be redirected to that route
  // if he wasn't, logic removes all other routes which were not added for all users (non/authenticated) users
  // and rejects redirecting to that route.
  // if here was somewhere else before routing to the route (which he should be authenticated before routing)
  // he will stay in that route, if he wasn't somewhere he will be redirected to authentication route
  @override
  FutureOr<OctopusState> call(
    List<OctopusHistoryEntry> history,
    OctopusState$Mutable state,
    Map<String, Object?> context,
  ) async {
    final user = await _getUser(); // Get the current user.

    final hasGuardedRoutes = state.children.any(
      (child) => _guardedRoutes.contains(child.name),
    );

    if (user.isNotAuthenticated && hasGuardedRoutes) {
      state.removeWhere((element) => _guardedRoutes.contains(element.name));
      return state;
    }

    return state;
  }
}
