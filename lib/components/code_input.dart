import 'package:flutter/material.dart';

class CodeInput extends StatelessWidget {
  final TextEditingController controller;

  const CodeInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 60,
      child: TextFormField(
        controller: controller,
        onChanged: (val) {
          if (val.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        autofocus: true,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey[400]!, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey[600]!, width: 2),
          ),
          counterText: '',
        ),
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Colors.grey[800]),
      ),
    );
  }
}
