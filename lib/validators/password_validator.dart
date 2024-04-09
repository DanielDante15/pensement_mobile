String? passwordValidator(String? str) {
  if (str!.length < 6) {
    return 'Senha deve conter no mínimo 6 dígitos';
  }
  return null;
}
