import 'package:aventude_assignment/app/core/constants/appconstans.dart';
import 'package:aventude_assignment/app/screens/comment_view.dart';
import 'package:aventude_assignment/app/screens/home_view.dart';
import 'package:aventude_assignment/app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.home:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RoutePaths.home),
            builder: (_) => const HomeView());
      case RoutePaths.login:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RoutePaths.login),
            builder: (_) => const LoginView());
      case RoutePaths.comment:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RoutePaths.comment),
            builder: (_) => const CommentView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
