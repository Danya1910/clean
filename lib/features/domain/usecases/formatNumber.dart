
String formatNumber(String number) {
  String cleanNumber = number.replaceAll(RegExp(r'[^0-9]'), '');
  if (cleanNumber.length <= 3) return cleanNumber;
  final buffer = StringBuffer();
  int offset = cleanNumber.length % 3;
  if (offset > 0) {
    buffer.write(cleanNumber.substring(0, offset));
    if (cleanNumber.length > 3) buffer.write(' ');
  }
  for (int i = offset; i < cleanNumber.length; i += 3) {
    buffer.write(cleanNumber.substring(i, i + 3));
    if (i + 3 < cleanNumber.length) buffer.write(' ');
  }
  return buffer.toString();
}