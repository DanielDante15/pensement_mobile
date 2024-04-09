import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

import '../pages/home_screen.dart';

class HomeRoute extends NuRoute {
  @override
  String get path => 'home';

  @override
  ScreenType? get screenType => materialScreenType;
  @override
  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return const HomeScreen();
  }
}
