String? validatePositiveNumber(num? value) {
  if (value == null || value <= 0) {
    return 'Значение должно быть больше 0';
  }
  return null;
}
