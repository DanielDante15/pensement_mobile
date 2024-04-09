import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';
import 'package:pensement_mobile/pages/expenses/expense_list_screen.dart';

class ExpenseArgs {
  final String id;

  ExpenseArgs({required this.id});
  static ExpenseArgs fromJson(Map<String, dynamic>? json) {
    return ExpenseArgs(id: json?['id'] ?? '');
  }
}

class HomeRoute extends NuRoute<NuRouter, ExpenseArgs, String> {
  @override
  String get path => 'expense-list-screen';

  @override
  ScreenType? get screenType => materialScreenType;

  @override
  ParamsParser<ExpenseArgs> get paramsParser => ExpenseArgs.fromJson;

  @override
  Widget build(BuildContext context, NuRouteSettings<ExpenseArgs?> settings) {
    return ExpenseListScreen(
      id: '',
    );
  }
}
