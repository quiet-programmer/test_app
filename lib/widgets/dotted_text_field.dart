import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_template/const_value.dart';

class CustomCodeTextField extends StatelessWidget {
  final int? codeLength;
  final String? code;
  final Color? dotColor;

  const CustomCodeTextField({
    super.key,
    required this.codeLength,
    required this.code,
    required this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        codeLength!,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                code!.length > index ? dotColor : frontColor.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
