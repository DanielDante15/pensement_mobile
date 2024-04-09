import 'package:pensement_mobile/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

class ProfileRoute extends NuRoute {
  @override
  String get path => 'profile';

  @override
  ScreenType? get screenType => materialScreenType;

  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return const ProfileScreen();
  }
}
