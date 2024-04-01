String reduceTextValue(double value, {int fractionDigits = 2}) {
  final absoluteValue = value.abs();
  String text;
  switch (absoluteValue) {
    case > 1000000000000:
      text = '${(absoluteValue / 1000000000000).toStringAsFixed(fractionDigits)}T';
    case > 1000000000:
      text = '${(absoluteValue / 1000000000).toStringAsFixed(fractionDigits)}B';
    case > 1000000:
      text = '${(absoluteValue / 1000000).toStringAsFixed(fractionDigits)}M';
    case > 1000:
      text = '${(absoluteValue / 1000).toStringAsFixed(fractionDigits)}K';
    default:
      text = absoluteValue.toStringAsFixed(fractionDigits+1);
  }
  return value.isNegative ? '-$text' : text;
}
