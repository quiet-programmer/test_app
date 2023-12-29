import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:my_template/app/auth/wrapper.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/functions/navigate_to.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      navigateReplaceTo(context, destination: const Wrapper());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('$imagesAssets/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                '$imagesAssets/liteteller_logo.png',
                width: 80.w,
                height: 80.w,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Liteteller',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                    color: defaultWhite
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}