import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'route_constants.dart';
import '../../features/auth/presentation/screens/driver_login_screen.dart';
import '../../features/driver/presentation/screens/driver_dashboard_screen.dart';
import '../../features/driver/presentation/screens/incoming_request_screen.dart';
import '../../features/driver/presentation/screens/navigation_screen.dart';
import '../../features/driver/presentation/screens/trip_active_screen.dart';
import '../../features/driver/presentation/screens/trip_complete_screen.dart';
import '../../features/profile/presentation/screens/driver_profile_screen.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/domain/auth_state.dart';

class RiverpodRouterListenable extends ChangeNotifier {
  RiverpodRouterListenable(Ref ref) {
    ref.listen<AuthState>(authProvider, (previous, next) => notifyListeners());
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final listenable = RiverpodRouterListenable(ref);

  return GoRouter(
    initialLocation: RouteConstants.login,
    refreshListenable: listenable,
    redirect: (context, state) {
      final authState = ref.read(authProvider);

      final isLoggedIn = authState.maybeWhen(
        authenticated: (token, name, phone, vehicle) => true,
        orElse: () => false,
      );

      final currentPath = state.matchedLocation;

      // Unauthenticated drivers are redirected to login if accessing protected screens
      final isAuthRoute = currentPath == RouteConstants.login;

      if (!isLoggedIn && !isAuthRoute) {
        return RouteConstants.login;
      }

      // Authenticated drivers are redirected to dashboard if accessing login
      if (isLoggedIn && currentPath == RouteConstants.login) {
        return RouteConstants.dashboard;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RouteConstants.login,
        builder: (context, state) => const DriverLoginScreen(),
      ),
      GoRoute(
        path: RouteConstants.dashboard,
        builder: (context, state) => const DriverDashboardScreen(),
      ),
      GoRoute(
        path: RouteConstants.request,
        builder: (context, state) => const IncomingRequestScreen(),
      ),
      GoRoute(
        path: RouteConstants.navigation,
        builder: (context, state) => const NavigationScreen(),
      ),
      GoRoute(
        path: RouteConstants.tripActive,
        builder: (context, state) => const TripActiveScreen(),
      ),
      GoRoute(
        path: RouteConstants.tripComplete,
        builder: (context, state) => const TripCompleteScreen(),
      ),
      GoRoute(
        path: RouteConstants.profile,
        builder: (context, state) => const DriverProfileScreen(),
      ),
    ],
  );
});
