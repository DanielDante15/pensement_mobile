import 'package:pensement_mobile/components/SnackBar/snacknbar.dart';
import 'package:pensement_mobile/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

void main() {
  runApp(const Bible());
}

class Bible extends StatelessWidget {
  const Bible({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: SnackbarManager.scaffoldMessengerKey,
      darkTheme: ThemeData.light(),
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Nuvigator(
        router: MyRouter(),
      ),
    );
  }
}
