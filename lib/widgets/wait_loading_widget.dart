import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_template/const_value.dart';

class WaitLoadingWidget extends StatefulWidget {
  const WaitLoadingWidget({super.key});

  @override
  State<WaitLoadingWidget> createState() => _WaitLoadingWidgetState();
}

class _WaitLoadingWidgetState extends State<WaitLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: defaultWhite,
      child: Stack(
        children: [
          Positioned(
            top: 1,
            bottom: 1,
            left: 1,
            right: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.w,
                  height: 100.w,
                  child: CircularProgressIndicator(
                    color: frontColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 1,
            bottom: 1,
            left: 1,
            right: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/dev/icon.png',
                  width: 60.w,
                  height: 60.w,
                  // width: 300.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}