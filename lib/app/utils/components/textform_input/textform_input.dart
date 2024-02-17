import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormInput extends StatelessWidget {
  const TextFormInput(
      {required this.controller, super.key,
        this.autovalidateMode,
        this.validator,
        this.labelText,
        this.obscureText = false,
        this.suffixIcon,
        this.prefixIcon,
        this.onChanged,
        this.onTap,
        this.inputFormatters,
        this.enabled,
        this.textLength,
        this.isBorderRadius = false,
        this.isColor = Colors.black,
        this.fillColor = Colors.white,
        this.filled = false,
        this.showBorder = true,
        this.borderColor = Colors.black,
        this.readOnly = false,
        this.borderRadius = 16,
        this.onFieldSubmitted,
        this.onTapOutside,
        this.onEditingComplete,
        this.focusNode,
        this.keyboardType,
        this.errorText,
      });

  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool readOnly;
  final bool filled;
  final bool showBorder;
  final double borderRadius;
  final Widget? prefixIcon;
  final bool isBorderRadius;
  final Color isColor;
  final Color fillColor;
  final Color borderColor;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onEditingComplete;
  final int? textLength;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      cursorColor: isColor,
      readOnly: readOnly,
      focusNode: focusNode,
      // maxLength: textLength,
      // maxLengthEnforcement: MaxLengthEnforcement.enforced,
      autovalidateMode: autovalidateMode,
      textCapitalization: TextCapitalization.words,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      obscuringCharacter: '*',
      style: Theme.of(context).textTheme.bodyMedium,
      textInputAction: TextInputAction.done,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onTapOutside: onTapOutside,
      onEditingComplete: onEditingComplete,
      //onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled,
        errorText: errorText,
        errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
          height: 0.2,
          color: Colors.red,
          letterSpacing: 0.5,
          fontSize: 0,),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        iconColor: Colors.grey,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: labelText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color:  Colors.white24,
          fontSize: 14,
          letterSpacing: 0,),
        //border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xffb42c3a), width: 0.7,)),
        focusedErrorBorder: InputBorder.none,
      ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
    );
  }
}
