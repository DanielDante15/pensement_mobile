String? emailValidator(String? str) {
  final emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
  );

  if (!emailRegex.hasMatch(str!)) {
    return 'Insira um email válido';
  }
  return null;
}
