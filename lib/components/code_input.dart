import 'package:flutter/material.dart';

class CodeInput extends StatelessWidget {
  const CodeInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 60,
      child: TextFormField(
        onSaved: (pin1) {},
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
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
