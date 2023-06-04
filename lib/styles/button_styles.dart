import 'package:flutter/material.dart';
import 'package:project/styles/color.dart';

class PrimaryButtons {
  static ButtonStyle filledButtonStylePrimaryBase = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryBase),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
  static ButtonStyle filledButtonStylePrimaryDarker = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryDarker),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
  static ButtonStyle filledButtonStyleWhiteDarkest = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColor.whiteDarkest),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}

class SecondaryButtons {
  static ButtonStyle outlinedButtonStylePrimaryBase = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColor.whiteBase),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: AppColor.primaryBase),
      ),
    ),
  );
  static ButtonStyle outlinedButtonStylePrimaryDarker = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColor.whiteBase),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: AppColor.primaryDarker),
      ),
    ),
  );
  static ButtonStyle outlinedButtonStyleWhiteDarkest = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColor.whiteBase),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: AppColor.whiteDarkest),
      ),
    ),
  );
}
