import 'package:pensement_mobile/routes/home_routes.dart';
import 'package:pensement_mobile/routes/login_route.dart';
import 'package:pensement_mobile/routes/profile_route.dart';
import 'package:pensement_mobile/routes/sign_up_route.dart';
import 'package:flutter/material.dart';

import 'package:nuvigator/next.dart';

class MyRouter extends NuRouter {
  @override
  String get initialRoute => 'login';

  @override
  List<NuRoute<NuRouter, Object?, Object?>> get registerRoutes => [
        LoginRoute(),
        HomeRoute(),
        ProfileRoute(),
        SignUpRoute(),
      ];

  Widget build(BuildContext context) {
    return Nuvigator(router: MyRouter());
  }
}
