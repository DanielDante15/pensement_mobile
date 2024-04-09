import 'package:pensement_mobile/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

class SignUpRoute extends NuRoute {
  @override
  String get path => 'sign-up';

  @override
  ScreenType? get screenType => cupertinoScreenType;

  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return const SignUpScreen();
  }
}
