int getDecimalValue(double value) {
  final valueString = value.toString();
  final decimalIndex = valueString.indexOf('.');
  if (decimalIndex == -1) {
    return 0;
  }
  return int.parse(valueString.substring(decimalIndex + 1));
}
