import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'route_constants.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/otp_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/booking/presentation/screens/booking_pickup_screen.dart';
import '../../features/booking/presentation/screens/booking_destination_screen.dart';
import '../../features/booking/presentation/screens/booking_summary_screen.dart';
import '../../features/tracking/presentation/screens/live_tracking_screen.dart';
import '../../features/history/presentation/screens/booking_history_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/sos/presentation/screens/emergency_sos_screen.dart';
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
    initialLocation: RouteConstants.splash,
    refreshListenable: listenable,
    redirect: (context, state) {
      final authState = ref.read(authProvider);

      final isLoggedIn = authState.maybeWhen(
        authenticated: (token, name, phoneNumber) => true,
        orElse: () => false,
      );

      final currentPath = state.matchedLocation;

      // Unauthenticated users are redirected to login if accessing protected screens
      final isAuthRoute = currentPath == RouteConstants.login || 
                          currentPath == RouteConstants.otp || 
                          currentPath == RouteConstants.onboarding ||
                          currentPath == RouteConstants.splash;

      if (!isLoggedIn && !isAuthRoute) {
        return RouteConstants.login;
      }

      // Authenticated users are redirected to home if accessing login or splash
      if (isLoggedIn && (currentPath == RouteConstants.login || currentPath == RouteConstants.otp || currentPath == RouteConstants.splash)) {
        return RouteConstants.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RouteConstants.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteConstants.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteConstants.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteConstants.otp,
        builder: (context, state) {
          final phoneNumber = state.extra as String? ?? '';
          return OTPScreen(phoneNumber: phoneNumber);
        },
      ),
      GoRoute(
        path: RouteConstants.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteConstants.bookingPickup,
        builder: (context, state) => const BookingPickupScreen(),
      ),
      GoRoute(
        path: RouteConstants.bookingDestination,
        builder: (context, state) => const BookingDestinationScreen(),
      ),
      GoRoute(
        path: RouteConstants.bookingSummary,
        builder: (context, state) {
          final hospitalName = state.extra as String? ?? 'Apollo Hospital';
          return BookingSummaryScreen(hospitalName: hospitalName);
        },
      ),
      GoRoute(
        path: RouteConstants.tracking,
        builder: (context, state) {
          final bookingId = state.pathParameters['bookingId'] ?? 'AMB-UNKNOWN';
          return LiveTrackingScreen(bookingId: bookingId);
        },
      ),
      GoRoute(
        path: RouteConstants.history,
        builder: (context, state) => const BookingHistoryScreen(),
      ),
      GoRoute(
        path: RouteConstants.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: RouteConstants.sos,
        builder: (context, state) => const EmergencySOSScreen(),
      ),
    ],
  );
});
