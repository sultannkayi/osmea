// Define the GoRouter
import 'package:admin_dashboard/views/view_splash/splash_view.dart';
import 'package:core/core.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// network page  configs serive
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  // Global route configuration
  routes: <RouteBase>[
    // GoRoute(
    //   path: '/home',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return HomeView(
    //       arguments: {
    //         "productTitle": "Products (Encrypted Storage)",
    //         "cardType": "Content Card",
    //         "description": "Home View Description"
    //       },
    //       currentView: MasterViewTypes.content,
    //     );
    //   },
    // ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        final flavor = Flavor.I;
        final isDev = flavor.environment == Environment.dev;

        return SplashView(
          arguments: {
            "title": "Splash View",
            "isDev": isDev,
            "environment": flavor.environment.toString(),
          },
          currentView: MasterViewTypes.content,
        );
      },
    ),
  ],
);
