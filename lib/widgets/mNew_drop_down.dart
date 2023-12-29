import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_template/const_value.dart';

class MNewDropDown extends StatefulWidget {
  final String? fieldKey;
  final String? fieldName;
  final String? value;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;
  final String? hintText;
  final Color? textColor;
  final Color? fillColor;
  final Color? defaultColor;
  final double? fontSize;
  final double? height;
  final bool? validateError;
  final ValueChanged<String?>? onChange;
  final List<DropdownMenuItem<String>>? items;

  const MNewDropDown({
    Key? key,
    this.fieldKey,
    required this.fieldName,
    this.value,
    this.initialValue,
    this.onSaved,
    this.textColor,
    this.fillColor,
    this.defaultColor,
    this.height,
    this.validateError = true,
    this.hintText = '',
    this.fontSize,
    this.onChange,
    required this.items,
  }) : super(key: key);

  @override
  _MNewDropDownState createState() => _MNewDropDownState();
}

class _MNewDropDownState extends State<MNewDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height ?? 48.h,
          child: DropdownButtonFormField(
            validator: widget.validateError == true
                ? (val) {
              return val == null ? 'Please this cannot be empty' : null;
            }
                : null,
            key: Key(widget.fieldKey.toString()),
            onChanged: widget.onChange,
            onSaved: widget.onSaved,
            isExpanded: true,
            value: widget.value,
            items: widget.items,
            style: TextStyle(
              color: widget.defaultColor ?? grey,
            ),
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.zero,
              // fillColor: widget.fillColor ?? secondaryGrey,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: defaultWhite,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: defaultWhite,
                  )),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: defaultWhite,
                  )),
              label: Text(
                '${widget.fieldName}',
                style: TextStyle(
                  color: widget.textColor ?? defaultBlack.withOpacity(0.6),
                ),
              ),
              hintText: '${widget.fieldName}',
              hintStyle: TextStyle(
                fontSize: 15.sp,
                color: widget.textColor ?? defaultBlack,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}