import 'dart:ui';
import 'package:flutter/material.dart';

class BTextField extends StatefulWidget {
  const BTextField(
      {super.key,
      required this.controller,
      this.isObscure,
      this.validator,
      this.keyboardType,
      this.hintText,
      this.title});

  final TextEditingController? controller;
  final bool? isObscure;
  final String? title;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;

  @override
  State<BTextField> createState() => _BTextFieldState();
}

class _BTextFieldState extends State<BTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(widget.title ?? ''),
                )
              : const SizedBox(),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(217, 217, 217, 1),
              borderRadius:
                  BorderRadius.circular(10), // Defina o raio da borda aqui
            ),
            height: 55,
            padding: const EdgeInsetsDirectional.only(start: 15),
            alignment: Alignment.center,
            child: TextFormField(
              selectionHeightStyle: BoxHeightStyle.includeLineSpacingBottom,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              validator: widget.validator,
              controller: widget.controller,
              obscureText: widget.isObscure ?? false,
              decoration:
                  InputDecoration.collapsed(hintText: widget.hintText ?? ""),
            ),
          ),
        ],
      ),
    );
  }
}
