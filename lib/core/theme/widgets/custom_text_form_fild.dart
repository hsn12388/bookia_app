import 'package:flutter/material.dart';

class CustomTextFormFild extends StatefulWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final bool isPassword;

  const CustomTextFormFild({
    super.key,
    required this.hintText,
    this.keyboardType,
    required TextInputType keyboardtype,
    this.isPassword = false,
  });

  @override
  State<CustomTextFormFild> createState() => _CustomTextFormFildState();
}

class _CustomTextFormFildState extends State<CustomTextFormFild> {
  bool isobscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && isobscure,
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    isobscure = !isobscure;
                  });
                },
                child: Icon(
                  isobscure ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        helperStyle: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: Color(0xff8391A1)),
      ),
    );
  }
}
