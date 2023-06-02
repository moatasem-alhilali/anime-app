import 'package:anime_app/features/Home/presentation/pages/SeeAllPage.dart';
import 'package:anime_app/main.dart';
import 'package:flutter/material.dart';


class RoutesManager {
  static const String main = "/";
  static const String screenDetail = "/screenDetail";
  static const String seeAllPage = "/screenDetail";
}

class RouterGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.main:
        return MaterialPageRoute(builder: (_) => MyApp());
      // case RoutesManager.seeAllPage:
      //   return MaterialPageRoute(builder: (_) => SeeAllPage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Not Found Route'),
        ),
        body: const Center(
          child: Text('Not Found Route'),
        ),
      ),
    );
  }
}
