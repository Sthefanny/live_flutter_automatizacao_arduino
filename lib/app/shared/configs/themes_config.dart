import 'package:flutter/widgets.dart';

class ThemesConfig {
  static final Color lightBlue = Color(0xFFA2CBFF);
  static final Color lightOn = Color(0xFFF2F5FA);
  static final Color lightOff = Color(0xFF424E5C);
  static final Color cardBg = Color(0xFF58667C);

  static const Gradient gradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF4A526E), Color(0xFF4D617E)],
  );
}
