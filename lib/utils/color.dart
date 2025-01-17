import 'dart:ui';

Brightness getBrightness(Color color) {
  double brightness =
      (color.red * 299 + color.green * 587 + color.blue * 114) / 1000;
  return brightness > 180 ? Brightness.light : Brightness.dark;
}

Color hexToColor(String hexColor) {
  return Color(int.parse('0xFF$hexColor'));
}
