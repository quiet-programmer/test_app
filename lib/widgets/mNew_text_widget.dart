import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/utils/money_formatter.dart';

class MNewTextField extends StatefulWidget {
  final double? height;
  final double? width;
  final int? maxLines;
  final int? maxLength;
  final String? sideText;
  final String? sideTextTwo;
  final String? fieldKey;
  final String? fieldName;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextAlign? textAlign;
  final FormFieldSetter<String>? onSave;
  final FormFieldSetter<String>? onChange;

  // final VoidCallback? onTap;
  final String? hintText;
  final String? leftIconImage;
  final String? rightIconImage;
  final double? fontSize;
  final Color? textColor;
  final Color? hintColor;
  final Color? fillColor;
  final bool isNumber;
  final bool isMoneyFormat;
  final bool isEmail;
  final bool isTransferPin;
  final bool isBVN;
  final bool isAccountNumber;
  final bool allowSymbols;
  final bool offText;
  final bool isPasswordField;
  final bool realOnly;
  final bool autofocus;
  final bool validateError;
  final VoidCallback? togglePasswordView;

  const MNewTextField({
    Key? key,
    this.height,
    this.width,
    this.maxLines,
    this.maxLength,
    this.fieldKey,
    required this.fieldName,
    required this.sideText,
    this.sideTextTwo,
    this.initialValue,
    this.textInputAction,
    this.textCapitalization,
    this.textAlign,
    this.onSave,
    this.onChange,
    // this.onTap,
    this.leftIconImage,
    this.rightIconImage,
    this.hintText = '',
    this.fontSize,
    this.textColor,
    this.hintColor,
    this.fillColor,
    this.isNumber = false,
    this.isMoneyFormat = false,
    this.isEmail = false,
    this.isTransferPin = false,
    this.isBVN = false,
    this.isAccountNumber = false,
    this.allowSymbols = true,
    this.offText = false,
    this.isPasswordField = false,
    this.realOnly = false,
    this.autofocus = false,
    this.validateError = true,
    this.togglePasswordView,
  }) : super(key: key);

  @override
  _MNewTextFieldState createState() => _MNewTextFieldState();
}

class _MNewTextFieldState extends State<MNewTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                '${widget.sideText}',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              widget.sideTextTwo == null ? const SizedBox() : Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: frontColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  '${widget.sideTextTwo}',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: defaultWhite,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: defaultBlack.withOpacity(0.12), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 1, // Blur radius
                offset: Offset(0, 0), // Offset in x and y directions
              ),
            ],
          ),
          child: TextFormField(
            initialValue: widget.initialValue,
            key: Key(widget.fieldKey.toString()),
            obscureText: widget.offText,
            validator: widget.validateError == true
                ? (String? val) {
              if (val!.isEmpty) {
                return 'Field must not be empty';
              } else {
                return null;
              }
            }
                : null,
            readOnly: widget.realOnly,
            onSaved: widget.onSave,
            onChanged: widget.onChange,
            autofocus: widget.autofocus,
            maxLines: widget.maxLines ?? 1,
            textInputAction: widget.textInputAction ?? TextInputAction.done,
            textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
            maxLength: widget.maxLength ?? null,
            inputFormatters: widget.allowSymbols == false
                ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ]
                : widget.isMoneyFormat == true
                ? [ThousandsSeparatorInputFormatter()]
                : [],
            keyboardType: widget.isEmail == true
                ? TextInputType.emailAddress
                : widget.isNumber == true
                ? TextInputType.number
                : TextInputType.text,
            cursorColor: frontColor,
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: widget.fillColor ?? secondaryGrey,
              suffixIcon: widget.isPasswordField == false
                  ? widget.rightIconImage == null
                  ? null
                  : Image.asset(
                '${widget.rightIconImage}',
                width: 18.w,
                height: 18.w,
              )
                  : IconButton(
                icon: widget.offText == true
                    ? FaIcon(FontAwesomeIcons.eye, color: grey)
                    : FaIcon(FontAwesomeIcons.eyeSlash, color: grey),
                onPressed: widget.togglePasswordView,
              ),
              prefixIcon: widget.leftIconImage == null
                  ? null
                  : Image.asset(
                '${widget.leftIconImage}',
                width: 18.w,
                height: 18.w,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: defaultBlack,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: defaultBlack,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: defaultBlack,
                ),
              ),
              hintText: '${widget.fieldName}',
              hintStyle: TextStyle(
                color: widget.hintColor ?? defaultBlack.withOpacity(0.4),
              ),
            ),
            textAlign: widget.textAlign ?? TextAlign.left,
            style: TextStyle(
              fontSize: 14.sp,
              color: widget.hintColor ?? defaultBlack.withOpacity(0.6),
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