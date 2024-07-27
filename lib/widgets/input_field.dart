import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.textInputType,
    this.label,
    this.hint,
    this.textInputAction,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final Function(String value)? onChanged;
  final bool obscureText;
  final String? label;
  final String? hint;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint ?? (label != null ? 'Enter $label' : null),
            counterText: '',
            errorMaxLines: 2,
          ),
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          textCapitalization: TextCapitalization.none,
          obscureText: obscureText,
          obscuringCharacter: '*',
          onChanged: onChanged,
        ),
      );
}
