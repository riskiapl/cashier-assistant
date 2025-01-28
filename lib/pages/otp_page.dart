import 'package:cashier_assistant/components/code_input.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key});

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.gpp_good,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    'Enter the verification code we have sent to your email at r***7@gmail.com.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 50),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CodeInput(),
                      CodeInput(),
                      CodeInput(),
                      CodeInput(),
                      CodeInput()
                    ],
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    // Implement your verification logic here
                    debugPrint('verify button tapped');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    minimumSize: Size(double.infinity, 50), // Set width to 100%
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn\'t receive an email?',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        // Implement your resend logic here
                        debugPrint('resend button tapped');
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
