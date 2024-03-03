import 'package:flutter/material.dart';
import 'package:task28/colors.dart';
import 'screenutil.dart';

class CustomContainer extends StatefulWidget {
  final String heading1;
  final String heading2;
  const CustomContainer(
      {super.key, required this.heading1, required this.heading2});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenUtil.screenHeight(context);
    final screenWidth = ScreenUtil.screenWidth(context);

    return Container(
      height: screenHeight * .055,
      width: double.infinity,
      color: textColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          children: [
            Text(
              widget.heading1,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            Spacer(),
            Text(
              widget.heading2,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
