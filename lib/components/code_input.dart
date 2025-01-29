import 'package:flutter/material.dart';

class CodeInput extends StatelessWidget {
  CodeInput({
    super.key,
  });

  // final value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 60,
      child: TextFormField(
        // controller: value,
        onChanged: (val) {
          if (val.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          // if (value.isEmpty) {
          //   FocusScope.of(context).previousFocus();
          // }
          debugPrint('Current value: $val');
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
