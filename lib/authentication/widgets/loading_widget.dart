import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project/styles/color.dart';

class AuthLoading extends StatelessWidget {
  const AuthLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: SpinKitCircle(
          size: 50.0,
          color: AppColor.primaryBase,
        ),
      ),
    );
  }
}
