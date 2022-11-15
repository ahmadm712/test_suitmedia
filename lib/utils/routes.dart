import 'package:flutter/material.dart';
import 'package:test_suitmedia/pages/home_page.dart';
import 'package:test_suitmedia/pages/second_page.dart';
import 'package:test_suitmedia/pages/thrid_page.dart';

var mainRoutes = (RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
    case SecondPage.routeName:
      Map argument = settings.arguments as Map;
      String name = argument['name'];
      String selectedName = argument['selected_name'];
      return MaterialPageRoute(
        builder: (context) => SecondPage(
          name: name,
          selectedName: selectedName,
        ),
      );
    case ThridPage.routeName:
      String name = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => ThridPage(
          name: name,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Page Not Found :('),
          ),
        ),
      );
  }
};
