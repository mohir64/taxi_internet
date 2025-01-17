import 'package:flutter/material.dart';
import '../screens/screen.dart';

class Routes {
  static const String home = '/home';
  static const String pickUp = '/pick_up';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case pickUp:
        return MaterialPageRoute(builder: (_) => const PickUpPage());

      case '/':
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Routes'),
                    centerTitle: true, // Judul di tengah
                  ),
                  body: const Center(
                    child: Text('Routes Not Found'),
                  ),
                ));
    }
  }
}
