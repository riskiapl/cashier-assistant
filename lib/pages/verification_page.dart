import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({super.key});

  // handle onchange text
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // handle button
  void handleSignIn() {}

  void handleForgotPassword(BuildContext context) {
    // Implement your forgot password logic here

    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: 'Forgot Password',
      text: 'Password reset instructions have been sent to your email.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: VerificationCode(
            textStyle: TextStyle(fontSize: 20.0, color: Colors.grey[900]),
            keyboardType: TextInputType.number,
            // underlineColor: Colors.amber, // If this is null it will use primaryColor: Colors.red from Theme
            length: 6,
            // cursorColor: Colors.blue, // If this is null it will default to the ambient
            // clearAll is NOT required, you can delete it
            // takes any widget, so you can implement your design
            clearAll: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'clear all',
                style: TextStyle(
                    fontSize: 14.0,
                    decoration: TextDecoration.underline,
                    color: Colors.blue[700]),
              ),
            ),
            onCompleted: (String value) {},
            onEditing: (bool value) {},
          ),
        ),
      ),
    );
  }
}
