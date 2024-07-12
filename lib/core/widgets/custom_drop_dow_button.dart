import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDowButton extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? valueStyle;

  final String? hintText;
  final String? selectedValue;
  final List<String>? list;
  final void Function(String?)? onChanged;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  const CustomDropDowButton(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.hintStyle,
      this.selectedValue,
      required this.list,
      this.onChanged,
      this.suffixIcon,
      this.backgroundColor,
      this.hintText,
      this.valueStyle});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        hint: Center(
          child: Text(
            hintText!,
            style: hintStyle ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
          ),
        ),
        decoration: InputDecoration(
          //uses less vertical space
          isDense: true,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0)),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16),
          ),

          fillColor: backgroundColor ?? Colors.grey,
          filled: true,
        ),

        // Initial Value
        value: selectedValue,

        // Down Arrow Icon
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
        ),

        // Array list of items
        items: list!.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(
              items,
              style: valueStyle ??
                  const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
            ),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: onChanged);
  }
}
