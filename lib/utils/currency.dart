String formatToIRR(double amount,
    {String symbol = 'IRR', int decimalDigits = 0}) {
  String formattedAmount = amount.toStringAsFixed(decimalDigits);

  List<String> parts = formattedAmount.split('.');
  String integerPart = parts[0];
  String fractionalPart = parts.length > 1 ? parts[1] : '';

  String result = integerPart.replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
    (Match match) => '${match.group(1)}.',
  );

  if (fractionalPart.isNotEmpty) {
    result = '$result,$fractionalPart';
  }

  return '$result $symbol';
}

double calculateDiscountedPrice({
  required double originalPrice,
  required double discountPercentage,
}) {
  if (discountPercentage < 0 || discountPercentage > 100) {
    throw ArgumentError('Discount percentage must be between 0 and 100');
  }
  return originalPrice - (originalPrice * (discountPercentage / 100));
}
