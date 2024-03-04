import 'package:flutter/material.dart';
import 'screenutil.dart';

class InputContainer extends StatelessWidget {
  final Widget child;
  final Border? border;
  const InputContainer({super.key, required this.child, this.border});

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenUtil.screenHeight(context);
    final screenWidth = ScreenUtil.screenWidth(context);

    return Container(
        height: screenHeight * .06,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: border,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child);
  }
}
