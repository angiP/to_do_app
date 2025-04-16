import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/src/config/palette.dart';

final class AppTheme {
  AppTheme._();

  static final String? _fontFamily = GoogleFonts.figtree().fontFamily;

  static final TextStyle w100 = GoogleFonts.figtree(
    fontWeight: FontWeight.w100,
  );
  static final TextStyle w200 = GoogleFonts.figtree(
    fontWeight: FontWeight.w200,
  );
  static final TextStyle w300 = GoogleFonts.figtree(
    fontWeight: FontWeight.w300,
  );
  static final TextStyle w400 = GoogleFonts.figtree(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle w500 = GoogleFonts.figtree(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle w600 = GoogleFonts.figtree(
    fontWeight: FontWeight.w600,
  );
  static final TextStyle w700 = GoogleFonts.figtree(
    fontWeight: FontWeight.w700,
  );
  static final TextStyle w800 = GoogleFonts.figtree(
    fontWeight: FontWeight.w800,
  );
  static final TextStyle w900 = GoogleFonts.figtree(
    fontWeight: FontWeight.w900,
  );

  // values taken from the Typography page here
  // https://www.figma.com/design/V6Pc90r1PuBo6cMA6YNllk/Companion-App?node-id=1827-2472&t=69rmTYLC7iDlVLpw-1
  static final TextTheme _baseTextTheme = TextTheme(
    displayLarge: w100.copyWith(
      fontSize: 40,
      letterSpacing: 0,
      height: 1.12,
    ), // undefined in Figma Typographie File
    displayMedium: w800.copyWith(
      fontSize: 48,
      letterSpacing: 0,
      height: 57.6 / 48,
    ),
    displaySmall: w800.copyWith(
      fontSize: 32,
      letterSpacing: 0,
      height: 38.4 / 32,
    ),

    headlineLarge: w700.copyWith(
      fontSize: 24,
      letterSpacing: 0,
      height: 30 / 24,
    ),
    headlineMedium: w700.copyWith(
      fontSize: 20,
      letterSpacing: 0,
      height: 20 / 18,
    ),
    headlineSmall: w700.copyWith(
      fontSize: 18,
      letterSpacing: 0,
      height: 24 / 18,
    ),

    titleLarge: w700.copyWith(
      fontSize: 18,
      letterSpacing: 0,
      height: 1.4,
    ), // undefined in Figma Typographie File
    titleMedium: w800.copyWith(
      fontSize: 18,
      letterSpacing: 0,
      height: 1.4,
    ), // undefined in Figma Typographie File
    titleSmall: w900.copyWith(
      fontSize: 18,
      letterSpacing: 0,
      height: 1.4,
    ), // undefined in Figma Typographie File

    bodyLarge: w500.copyWith(fontSize: 16, letterSpacing: 0, height: 24 / 16),
    bodyMedium: w600.copyWith(fontSize: 14, letterSpacing: 0, height: 20 / 14),
    bodySmall: w500.copyWith(fontSize: 12, letterSpacing: 0, height: 16.8 / 12),

    labelLarge: w800.copyWith(
      fontSize: 12,
      letterSpacing: 0,
      height: 1.4,
    ), // undefined in Figma Typographie File
    labelMedium: w600.copyWith(
      fontSize: 10,
      letterSpacing: 0,
      height: 1.4,
    ), // undefined in Figma Typographie File
    labelSmall: w600.copyWith(fontSize: 10, letterSpacing: 0, height: 12 / 10),
  );

  static final TextTheme _lightTextTheme = _baseTextTheme.apply(
    bodyColor: Palette.fontBlack,
    displayColor: Palette.fontBlack,
  );

  static final TextTheme _darkTextTheme = _baseTextTheme.apply(
    bodyColor: Palette.fontWhite,
    displayColor: Palette.fontWhite,
  );

  static ThemeData get lightTheme => FlexThemeData.light(
    colors: FlexSchemeColor(
      primary: const Color(0xffff9500),
      primaryContainer: const Color(0xffffcc80),
      secondary: const Color(0xff0028C3),
      secondaryContainer: const Color(0xffe4eaff),
      tertiary: const Color(0xff0028C3),
      tertiaryContainer: const Color(0xff0028C3).lighten(40),
      appBarColor: const Color(0xffe4eaff),
      error: Palette.lightError,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useMaterial3Typography: true,
      useM2StyleDividerInM3: true,
      textButtonSchemeColor: SchemeColor.onPrimaryContainer,
      filledButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      outlinedButtonBorderWidth: .5,
      elevatedButtonRadius: 8.0,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderSchemeColor: SchemeColor.onPrimary,
      inputDecoratorRadius: 8.0,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
      cardElevation: 2.0,
      toggleButtonsBorderWidth: 0,
      toggleButtonsSchemeColor: SchemeColor.onSecondaryContainer,
      toggleButtonsRadius: 8.0,
      checkboxSchemeColor: SchemeColor.onSecondaryContainer,
      navigationBarIndicatorOpacity: 0,
      navigationBarLabelTextStyle: _lightTextTheme.bodySmall,
      tooltipSchemeColor: SchemeColor.primary,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: _fontFamily,
    textTheme: _lightTextTheme,
    scaffoldBackground: Palette.bgBlue,
    // onPrimary: Colors.white,
  ).copyWith(extensions: [CustomTextStyles.light(_lightTextTheme)]);

  static ThemeData get darkTheme => FlexThemeData.dark(
    scheme: FlexScheme.outerSpace,
    // colors: const FlexSchemeColor(
    //   primary: Color(0xffff9500),
    //   primaryContainer: Color(0xffc87200),
    //   secondary: Color(0xff82b1ff),
    //   secondaryContainer: Color(0xff3770cf),
    //   tertiary: Palette.green,
    //   tertiaryContainer: Color(0xff0b429c),
    //   appBarColor: Color(0xff3770cf),
    //   error: Palette.darkError,
    // ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: FlexSubThemesData(
      blendOnLevel: 20,
      useMaterial3Typography: true,
      useM2StyleDividerInM3: true,
      textButtonSchemeColor: SchemeColor.onPrimaryContainer,
      filledButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      elevatedButtonRadius: 8.0,
      inputDecoratorIsFilled: false,
      inputDecoratorRadius: 8.0,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
      cardElevation: 2.0,
      toggleButtonsSchemeColor: SchemeColor.onSecondaryContainer,
      toggleButtonsRadius: 8.0,
      navigationBarIndicatorOpacity: 0,
      navigationBarLabelTextStyle: _darkTextTheme.bodySmall,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: _fontFamily,
    textTheme: _darkTextTheme,
    // onPrimary: Colors.white,
  ).copyWith(extensions: [CustomTextStyles.dark(_darkTextTheme)]);
}

@immutable
class CustomTextStyles extends ThemeExtension<CustomTextStyles> {
  const CustomTextStyles({
    required this.bodyLargeHighlighted,
    required this.bodyMediumHighlighted,
    required this.bodySmallEmphasized,
    required this.tileCountdown,
    required this.bodyLargeError,
    required this.titleLargeError,
    required this.bodySmallDarkened,
    required this.bodyMediumDarkened,
    required this.tileCountdownDarkened,
    required this.bodySmallEmphasizedDarkened,
    required this.bodyLargeHighlightedDark,
    required this.labelLargeError,
  });

  final TextStyle bodyLargeHighlighted;
  final TextStyle bodyMediumHighlighted;
  final TextStyle bodySmallEmphasized;
  final TextStyle tileCountdown;
  final TextStyle bodyLargeError;
  final TextStyle titleLargeError;
  final TextStyle bodySmallDarkened;
  final TextStyle bodyMediumDarkened;
  final TextStyle tileCountdownDarkened;
  final TextStyle bodySmallEmphasizedDarkened;
  final TextStyle bodyLargeHighlightedDark;
  final TextStyle labelLargeError;

  @override
  CustomTextStyles copyWith({
    TextStyle? bodyLargeHighlighted,
    TextStyle? bodyMediumHighlighted,
    TextStyle? bodySmallEmphasized,
    TextStyle? tileCountdown,
    TextStyle? bodyLargeError,
    TextStyle? titleLargeError,
    TextStyle? bodySmallDarkened,
    TextStyle? bodyMediumDarkened,
    TextStyle? tileCountdownDarkened,
    TextStyle? bodySmallEmphasizedDarkened,
    TextStyle? bodyLargeHighlightedDark,
    TextStyle? labelLargeError,
  }) {
    return CustomTextStyles(
      labelLargeError: labelLargeError ?? this.labelLargeError,
      bodyLargeHighlighted: bodyLargeHighlighted ?? this.bodyLargeHighlighted,
      bodyMediumHighlighted:
          bodyMediumHighlighted ?? this.bodyMediumHighlighted,
      bodySmallEmphasized: bodySmallEmphasized ?? this.bodySmallEmphasized,
      tileCountdown: tileCountdown ?? this.tileCountdown,
      bodyLargeError: bodyLargeError ?? this.bodyLargeError,
      titleLargeError: titleLargeError ?? this.titleLargeError,
      bodySmallDarkened: bodySmallDarkened ?? this.bodySmallDarkened,
      bodyMediumDarkened: bodyMediumDarkened ?? this.bodyMediumDarkened,
      tileCountdownDarkened:
          tileCountdownDarkened ?? this.tileCountdownDarkened,
      bodySmallEmphasizedDarkened:
          bodySmallEmphasizedDarkened ?? this.bodySmallEmphasizedDarkened,
      bodyLargeHighlightedDark:
          bodyLargeHighlightedDark ?? this.bodyLargeHighlightedDark,
    );
  }

  @override
  CustomTextStyles lerp(ThemeExtension<CustomTextStyles>? other, double t) {
    if (other is! CustomTextStyles) {
      return this;
    }
    return CustomTextStyles(
      labelLargeError:
          TextStyle.lerp(labelLargeError, other.labelLargeError, t)!,
      bodyLargeHighlightedDark:
          TextStyle.lerp(
            bodyLargeHighlightedDark,
            other.bodyLargeHighlightedDark,
            t,
          )!,
      bodyLargeHighlighted:
          TextStyle.lerp(bodyLargeHighlighted, other.bodyLargeHighlighted, t)!,
      bodyMediumHighlighted:
          TextStyle.lerp(
            bodyMediumHighlighted,
            other.bodyMediumHighlighted,
            t,
          )!,
      bodySmallEmphasized:
          TextStyle.lerp(bodySmallEmphasized, other.bodySmallEmphasized, t)!,
      tileCountdown: TextStyle.lerp(tileCountdown, other.tileCountdown, t)!,
      bodyLargeError: TextStyle.lerp(bodyLargeError, other.bodyLargeError, t)!,
      titleLargeError:
          TextStyle.lerp(titleLargeError, other.titleLargeError, t)!,
      bodySmallDarkened:
          TextStyle.lerp(bodySmallDarkened, other.bodySmallDarkened, t)!,
      bodyMediumDarkened:
          TextStyle.lerp(bodyMediumDarkened, other.bodyMediumDarkened, t)!,
      tileCountdownDarkened:
          TextStyle.lerp(
            tileCountdownDarkened,
            other.tileCountdownDarkened,
            t,
          )!,
      bodySmallEmphasizedDarkened:
          TextStyle.lerp(
            bodySmallEmphasizedDarkened,
            other.bodySmallEmphasizedDarkened,
            t,
          )!,
    );
  }

  // Factory constructors for light and dark variants
  static CustomTextStyles light(TextTheme textTheme) => CustomTextStyles(
    labelLargeError: textTheme.labelLarge!.copyWith(color: Palette.lightError),
    bodyLargeHighlightedDark: textTheme.bodyLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 24 / 16,
      color: Palette.fontBlack,
    ),
    bodySmallEmphasizedDarkened: textTheme.bodySmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      height: 16.8 / 12,
      color: Palette.blackOut400,
    ),
    tileCountdownDarkened: textTheme.bodySmall!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      height: 12 / 10,
      color: Palette.blackOut400,
    ),
    bodyMediumDarkened: textTheme.bodyMedium!.copyWith(
      color: Palette.blackOut400,
    ),
    bodySmallDarkened: textTheme.bodySmall!.copyWith(
      color: Palette.blackOut400,
    ),
    titleLargeError: textTheme.titleLarge!.copyWith(color: Palette.lightError),
    bodyLargeError: textTheme.bodyLarge!.copyWith(color: Palette.lightError),
    bodyLargeHighlighted: textTheme.bodyLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 24 / 16,
    ),
    bodyMediumHighlighted: textTheme.bodyMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w800,
      height: 20 / 14,
    ),
    bodySmallEmphasized: textTheme.bodySmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      height: 16.8 / 12,
    ),
    tileCountdown: textTheme.bodySmall!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      height: 12 / 10,
    ),
  );

  static CustomTextStyles dark(TextTheme textTheme) => CustomTextStyles(
    labelLargeError: textTheme.labelLarge!.copyWith(color: Palette.darkError),
    bodyLargeHighlightedDark: textTheme.bodyLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 24 / 16,
      // color: Palette.fontBlack,
    ),
    bodySmallEmphasizedDarkened: textTheme.bodySmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      height: 16.8 / 12,
      color: Palette.blackOut300,
    ),
    tileCountdownDarkened: textTheme.bodySmall!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      height: 12 / 10,
      color: Palette.blackOut300,
    ),
    bodyMediumDarkened: textTheme.bodyMedium!.copyWith(
      color: Palette.blackOut300,
    ),
    bodySmallDarkened: textTheme.bodySmall!.copyWith(
      color: Palette.blackOut300,
    ),
    titleLargeError: textTheme.titleLarge!.copyWith(color: Palette.darkError),
    bodyLargeError: textTheme.bodyLarge!.copyWith(color: Palette.darkError),
    bodyLargeHighlighted: textTheme.bodyLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 24 / 16,
    ),
    bodyMediumHighlighted: textTheme.bodyMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w800,
      height: 20 / 14,
    ),
    bodySmallEmphasized: textTheme.bodySmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      height: 16.8 / 12,
    ),
    tileCountdown: textTheme.bodySmall!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      height: 12 / 10,
    ),
  );
}
