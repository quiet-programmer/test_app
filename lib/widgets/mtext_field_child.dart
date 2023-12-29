import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_template/const_value.dart';

class MTextFieldChild extends StatefulWidget {
  final String? title;
  final String? sideText;
  final Widget? child;
  final Widget? secondChild;
  final VoidCallback? onTap;
  const MTextFieldChild({
    Key? key,
    this.title,
    required this.sideText,
    this.child,
    this.secondChild,
    this.onTap,
  }) : super(key: key);

  @override
  _MTextFieldChildState createState() => _MTextFieldChildState();
}

class _MTextFieldChildState extends State<MTextFieldChild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '${widget.sideText}',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: defaultBlack.withOpacity(0.12), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 1, // Blur radius
                offset: const Offset(0, 0), // Offset in x and y directions
              ),
            ],
          ),
          child: Container(
            height: 50.h,
            width: 343.w,
            padding: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
            decoration: BoxDecoration(
                color: defaultWhite,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: defaultBlack
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: widget.child!,
                        ),
                        InkWell(
                          onTap: widget.onTap,
                          child: widget.secondChild == null
                              ? Container()
                              : widget.secondChild!,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}