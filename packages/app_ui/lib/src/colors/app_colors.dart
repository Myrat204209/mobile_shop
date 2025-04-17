import 'package:flutter/material.dart';

/// `AppColors` is a utility class that holds color constants
/// for both Light and Dark modes to maintain color consistency
/// across the app.
abstract class AppColors {
  /// Main accent color (Orange) used throughout the app in Light Mode.
  /// Typically applied to buttons, icons, and primary UI elements.
  static const Color mainAccent = Color(0xFFFF6F00);

  /// Main accent color (Orange) used throughout the app in Dark Mode.
  /// Matches Light Mode's main accent but adapted for dark backgrounds.
  static const Color mainAccentDark = Color(0xFFFFAB40);

  /// Secondary accent color (Green) for Light Mode.
  /// Used as a subtle complementary color for main accents.
  static const Color secondAccent = Color(0xFF4CAF50);

  /// Secondary accent color (Green) for Dark Mode.
  /// Complements main accents with a darker tone.
  static const Color secondAccentDark = Color(0xFF66BB6A);

  /// Background color for primary surfaces in Light Mode.
  /// Typically used as a screen or main content background.
  static const Color bgMain = Color(0xFFFFFFFF);

  /// Background color for primary surfaces in Dark Mode.
  /// Used to match Light Mode's primary background for dark themes.
  static const Color bgMainDark = Color(0xFF121212);

  /// Secondary background color in Light Mode.
  /// Used for cards, containers, and other secondary surfaces.
  static const Color bgSecond = Color(0xFFF5F5F5);

  /// Secondary background color in Dark Mode.
  /// Complements Dark Mode's main background with a slightly different shade.
  static const Color bgSecondDark = Color(0xFF1E1E1E);

  /// Light alert background color in Light Mode.
  /// Used for backgrounds of alert or warning UI elements.
  static const Color alertLightAccent = Color(0xFFFFEDEF);

  /// Light alert background color in Dark Mode.
  /// Used for subtle alert backgrounds in dark themes.
  static const Color alertLightAccentDark = Color(0xFFC5B3B6);

  /// Major accent for light-colored alert backgrounds in Light Mode.
  /// Typically used for background of major alerts or notifications.
  static const Color majorLightAccent = Color(0xFFFFEFD9);

  /// Major accent for light-colored alert backgrounds in Dark Mode.
  static const Color majorLightAccentDark = Color(0xFFC5B8A5);

  /// Alert color (Red) used for text and icons in Light Mode.
  /// Ideal for error and critical warnings.
  static const Color alertAccent = Color(0xFFF44336);

  /// Alert color (Red) for Dark Mode.
  /// Used for icons and text in error or critical warning messages.
  static const Color alertAccentDark = Color(0xFFE57373);

  /// Primary text color (Black) for Light Mode.
  /// Typically used for body text and headings.
  static const Color textColor = Color(0xFF000000);

  /// Primary text color (White) for Dark Mode.
  /// Adapts Light Mode's primary text color for dark backgrounds.
  static const Color textColorDark = Color(0xFFFFFFFF);

  /// Secondary text color (Gray) for Light Mode.
  /// Used for less prominent text or placeholders.
  static const Color textLight = Color(0xFF757575);

  /// Secondary text color (Light Gray) for Dark Mode.
  /// Complements Light Mode's secondary text color for dark themes.
  static const Color textLightDark = Color(0xFFBDBDBD);

  /// Light title text color (Gray) for Light Mode.
  /// Typically used for subtitles and minor headings.
  static const Color textLightTitle = Color(0xFF797979);

  /// Light title text color (Light Gray) for Dark Mode.
  static const Color textLightTitleDark = Color(0xFFA9A9A9);

  /// Border color (Light Gray) for Light Mode.
  /// Used for dividers, outlines, and card borders.
  static const Color border = Color(0xFFE0E0E0);

  /// Border color (Darker Gray) for Dark Mode.
  static const Color borderDark = Color(0xFF424242);

  /// Major accent color (Purple) in Light Mode.
  /// Often used to draw attention to important elements like promotional banners.
  static const Color majorAccent = Color(0xFF9C27B0);

  /// Major accent color (Purple) in Dark Mode.
  static const Color majorAccentDark = Color(0xFFBA68C8);

  /// Tertiary accent color (Dark Blue) for Light Mode.
  /// Adds a cool accent to the app's color palette, used in payment buttons.
  static const Color thirdAccent = Color(0xFF1976D2);

  /// Tertiary accent color (Dark Blue) for Dark Mode.
  static const Color thirdAccentDark = Color(0xFF42A5F5);

  /// Light variation of the tertiary accent (Light Blue) in Light Mode.
  /// Used as a soft background or for subtle highlights, like on product labels.
  static const Color thirdLightAccent = Color(0xFFE3F2FD);

  /// Light variation of the tertiary accent (Light Blue) in Dark Mode.
  static const Color thirdLightAccentDark = Color(0xFF90CAF9);

  /// Highlight color (Yellow) for Light Mode.
  /// Used for star ratings and emphasis elements.
  static const Color highlightColor = Color(0xFFFFEB3B);

  /// Highlight color (Yellow) for Dark Mode.
  static const Color highlightColorDark = Color(0xFFFFF176);

  /// Secondary button background color (Light Gray) in Light Mode.
  /// Used for buttons like "Проверить скидки".
  static const Color buttonBackground = Color(0xFFE8ECEF);

  /// Secondary button background color (Dark Gray) in Dark Mode.
  static const Color buttonBackgroundDark = Color(0xFF2E2E2E);
}