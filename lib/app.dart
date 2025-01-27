import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rainbow_reach/ui/screens/dashboard/user_dashboard_screen.dart';

import 'package:rainbow_reach/ui/screens/login/login_screen.dart';
import 'package:rainbow_reach/ui/screens/profile/profile_screen.dart';

bool isUserLoggedIn = false; // Placeholder for login state
bool isProfileComplete = false; // Placeholder for profile completion state

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const UserDashboardScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
