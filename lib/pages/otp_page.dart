import 'package:cashier_assistant/components/code_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickalert/quickalert.dart';
import 'package:cashier_assistant/pages/login_page.dart';
import 'package:cashier_assistant/components/button.dart';
import 'package:cashier_assistant/services/auth_services.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key});

  // handle onchange text
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final otp1 = TextEditingController();
  final otp2 = TextEditingController();
  final otp3 = TextEditingController();
  final otp4 = TextEditingController();
  final otp5 = TextEditingController();

  final AuthServices authServices = AuthServices();

  // handle button
  void handleSignIn() {}

  void handlePaste(BuildContext context, String pastedText) {
    if (pastedText.length == 5 &&
        RegExp(r'^[a-zA-Z0-9]+$').hasMatch(pastedText)) {
      otp1.text = pastedText[0];
      otp2.text = pastedText[1];
      otp3.text = pastedText[2];
      otp4.text = pastedText[3];
      otp5.text = pastedText[4];

      FocusScope.of(context).requestFocus(FocusNode());
    } else {
      // Handle invalid paste text
      debugPrint('Invalid paste text');
    }
  }

  void verifyOtp(BuildContext context) async {
    String otpCode = otp1.text + otp2.text + otp3.text + otp4.text + otp5.text;
    String email = 'riski97@gmail.com';

    if (otpCode.length == 5) {
      try {
        Map<String, dynamic> isVerified =
            await authServices.verifyOtp(email, otpCode);
        if (isVerified['status'] == 'success') {
          if (context.mounted) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              title: 'Verification Successful',
              text: isVerified['message'],
            );
          }
        } else if (isVerified['status'] == 'failed') {
          if (context.mounted) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Verification Failed',
              text: isVerified['message'],
            );
          }
        }
      } catch (e) {
        if (context.mounted) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Error',
            text:
                'An error occurred while verifying the OTP. Please try again.',
          );
        }
      }
    } else {
      if (context.mounted) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          title: 'Invalid OTP',
          text: 'Please enter a valid 5-digit OTP code.',
        );
      }
    }
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
                  backgroundColor: Colors.grey[700],
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
                    'Please enter the verification code sent to your email address r***7@gmail.com.',
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
                      CodeInput(controller: otp1),
                      CodeInput(controller: otp2),
                      CodeInput(controller: otp3),
                      CodeInput(controller: otp4),
                      CodeInput(controller: otp5),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      // Implement your paste logic here
                      Clipboard.getData('text/plain').then((clipboardContent) {
                        if (clipboardContent != null && context.mounted) {
                          handlePaste(context, clipboardContent.text ?? '');
                        }
                      });
                    },
                    child: Text(
                      'Paste',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Verify',
                  onTap: () {
                    // Implement your verification logic here
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      title: 'Verification Successful',
                      text:
                          'You have successfully verified your email address.',
                    );
                  },
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
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
