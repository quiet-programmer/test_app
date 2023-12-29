import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_template/const_value.dart';

class MButton extends StatefulWidget {
  final String? title;
  final String? secondTitle;
  final double? radius;
  final double? width;
  final double? height;
  final Color? btnColor;
  final Color? textColor;
  final double? textSize;
  final Color? borderColor;
  final IconData? btnIcon;
  final bool isLoading;
  final bool isTwoText;
  final bool hasIcon;
  final bool isTextBold;
  final VoidCallback? onPressed;

  const MButton({
    Key? key,
    required this.title,
    this.secondTitle,
    this.radius,
    this.width,
    this.height,
    this.btnColor,
    this.textColor,
    this.textSize,
    this.borderColor,
    this.btnIcon,
    this.isLoading = false,
    this.isTwoText = false,
    this.hasIcon = false,
    this.isTextBold = false,
    required this.onPressed,
  })  : assert(
  title != null,
  onPressed != null,
  ),
        super(key: key);

  @override
  _MButtonState createState() => _MButtonState();
}

class _MButtonState extends State<MButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 327.w,
      height: widget.height ?? 52.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: widget.btnColor ?? frontColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 12),
            side: BorderSide(color: widget.borderColor ?? Colors.transparent),
          ),
        ),
        onPressed: widget.onPressed,
        child: widget.isLoading == false
            ? widget.isTwoText == true
            ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.title}',
              style: GoogleFonts.poppins(
                fontSize: widget.textSize ?? 16.sp,
                fontWeight: widget.isTextBold == true
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: widget.textColor ?? Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '${widget.secondTitle}',
              style: GoogleFonts.poppins(
                fontSize: widget.textSize ?? 16.sp,
                fontWeight: widget.isTextBold == true
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: widget.textColor ?? Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )
            : widget.hasIcon == true
            ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              widget.btnIcon,
              color: defaultWhite,
            ),
            Text(
              '${widget.title}',
              style: GoogleFonts.poppins(
                fontSize: widget.textSize ?? 16.sp,
                fontWeight: widget.isTextBold == true
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: widget.textColor ?? Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )
            : Text(
          '${widget.title}',
          style: GoogleFonts.poppins(
            fontSize: widget.textSize ?? 13.sp,
            fontWeight: widget.isTextBold == true
                ? FontWeight.bold
                : FontWeight.normal,
            color: widget.textColor ?? Colors.white,
          ),
          textAlign: TextAlign.center,
        )
            : SizedBox(
          width: 20.w,
          height: 20.w,
          child: const CircularProgressIndicator(
            color: defaultWhite,
          ),
        ),
      ),
    );
  }
}