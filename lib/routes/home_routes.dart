import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

import '../pages/home_screen.dart';

class HomeScreenArgs {
  final String id;

  HomeScreenArgs({required this.id});
  static HomeScreenArgs fromJson(Map<String, dynamic>? json) {
    return HomeScreenArgs(id: json?['id'] ?? '');
  }
}

class HomeRoute extends NuRoute<NuRouter, HomeScreenArgs, String> {
  @override
  String get path => 'home';

  @override
  ScreenType? get screenType => materialScreenType;

  @override
  ParamsParser<HomeScreenArgs> get paramsParser => HomeScreenArgs.fromJson;

  @override
  Widget build(
      BuildContext context, NuRouteSettings<HomeScreenArgs?> settings) {
    return HomeScreen(
      id: settings.args?.id,
    );
  }
}
