import 'package:flutter/material.dart';
import 'package:nlearn_v3_home/config/routes/routes.dart';
import 'package:nlearn_v3_home/features/home/presentation/pages/home_list_screen.dart';
import 'package:nlearn_v3_home/features/home/presentation/pages/login_screen.dart';

class AppRouterSettings {
  Route<Object?> generateRouter(RouteSettings settings) {
    var router = AppRouter.getRouterByName(settings.name!);

    switch (router) {
      case AppRouter.home:
        return MaterialPageRoute(
          builder: (_) => const HomeListScreen(),
        );
      case AppRouter.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
