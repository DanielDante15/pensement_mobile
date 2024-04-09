import 'package:flutter/material.dart';
import 'package:pensement_mobile/contexts/UserContext.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final instance = UserContext.service;
    instance.getUserById(id);
    return ListenableBuilder(
        listenable: instance,
        builder: (context, _) {
          if (instance.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (instance.error) {
            return const Center(
              child: Text('Error while trying to retrieve data'),
            );
          }
          return Text('${instance.user}');
        });
  }
}
