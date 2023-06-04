import 'package:flutter/material.dart';
import 'package:project/styles/assets.dart';
import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';

Widget verticalSizedBox(double height) => SizedBox(
      height: height,
    );

Widget titlePage(String title) => Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(title, style: TextStyles.headline4),
    );

Widget logoPage() => Center(
      child: Image.asset(
        AppAssets.icLogo,
        height: 180,
      ),
    );

Widget textFieldLabel(String label) => Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 5),
      child: Text(
        label,
        style: TextStyles.subtitle2,
      ),
    );

Widget bottomButton(String title, BuildContext context, VoidCallback navigation) => Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryDarker),
            color: AppColor.primaryBase,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Belum punya akun?',
                style: TextStyles.body1.copyWith(color: AppColor.whiteBase),
              ),
              TextButton(
                onPressed: navigation,
                child: Text(
                  title,
                  style: TextStyles.body1.copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColor.whiteBase,
                    decorationColor: AppColor.whiteBase,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
