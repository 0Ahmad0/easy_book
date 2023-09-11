import 'package:flutter/material.dart';
import 'package:patient_journey/constants/app_colors.dart';

class AppTextFormFiled extends StatefulWidget {
  AppTextFormFiled(
      {Key? key,
        this.textInputAction = TextInputAction.next,
        this.keyboardType = TextInputType.text,
        this.controller,
        this.iconData,
        this.hintText,
        this.obscureText = false,
        this.suffixIcon = false,
        this.validator,
        this.onChanged,
        this.onTap,
        this.autofocus = false,
        this.readOnly = false,
        this.maxline = 1,
        this.minline = 1})
      : super(key: key);

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final IconData? iconData;
  final String? hintText;
  final bool suffixIcon;
  final bool autofocus;
  final bool readOnly;
  bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final int? maxline;
  final int? minline;

  @override
  State<AppTextFormFiled> createState() => _TextFiledAppState();
}

class _TextFiledAppState extends State<AppTextFormFiled> {
  void showPassword() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxline,
      minLines: widget.minline,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      validator: widget.validator ??
              (String? val) {
            if (val!.trim().isEmpty) return 'Required*';
            return null;
          },
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,

      decoration: InputDecoration(
          border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0)
          ),

          prefixIcon: widget.iconData == null
              ? null
              : Icon(
            widget.iconData,
            size:  24,
          ),
          suffixIcon: widget.suffixIcon
              ? IconButton(onPressed: (){
            showPassword();
          }, icon: Icon(widget.obscureText
              ?Icons.visibility
              :Icons.visibility_off,
            color: !widget.obscureText?Theme.of(context).primaryColor:
            AppColors.grey,
          ))
              : null,
          hintText: widget.hintText),
    );
  }
}