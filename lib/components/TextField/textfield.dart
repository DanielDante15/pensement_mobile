import 'dart:ui';

import 'package:flutter/material.dart';

class BTextField extends StatefulWidget {
  const BTextField({
    super.key,
    required this.controller,
    this.isObscure = false,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.title,
  });

  final TextEditingController controller;
  final bool isObscure;
  final String? title;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;

  @override
  State<BTextField> createState() => _BTextFieldState();
}

class _BTextFieldState extends State<BTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(widget.title ?? ''),
            ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(217, 217, 217, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    selectionHeightStyle:
                        BoxHeightStyle.includeLineSpacingBottom,
                    keyboardType: widget.keyboardType ?? TextInputType.text,
                    validator: widget.validator,
                    controller: widget.controller,
                    obscureText: widget.isObscure && _isObscure,
                    decoration: InputDecoration.collapsed(
                      hintText: widget.hintText ?? '',
                    ),
                  ),
                ),
                if (widget.isObscure)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
