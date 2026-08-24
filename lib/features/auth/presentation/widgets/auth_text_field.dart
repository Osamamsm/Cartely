import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class LabeledAuthTextField extends StatelessWidget {
  const LabeledAuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.onSaved,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText,
    this.controller,
  });

  final String label;
  final String hintText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleSmall),
        vGap(5),
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: controller,
          keyboardType: keyboardType,
          onSaved: onSaved,
          validator: validator,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
