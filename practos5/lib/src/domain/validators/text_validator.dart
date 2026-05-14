String? validateRequired(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Поле не может быть пустым';
  }
  return null;
}
