import 'package:cashier_assistant/components/button.dart';
import 'package:cashier_assistant/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../services/auth_services.dart';
import 'otp_page.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});

  final emailController = TextEditingController();
  final AuthServices authServices = AuthServices();

  Future<void> handleSendOtp(BuildContext context) async {
    final email = emailController.text;
    if (email.isEmpty) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Error',
        text: 'Please enter your email.',
      );
      return;
    }

    final res = await authServices.sendOtp(email);

    if (res['status'] == 'success') {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'OTP Sent',
        text: res['message'],
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpPage()),
      );
    } else {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Failed',
        text: res['message'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // logo
                const Icon(
                  Icons.lock_reset,
                  size: 100,
                  color: Colors.black,
                ),

                Text(
                  'Forget Password',
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                ),

                const SizedBox(
                  height: 25,
                ),

                // email text field
                InputField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(
                  height: 25,
                ),

                // send otp button
                CustomButton(
                  text: 'Send OTP',
                  onTap: () => handleSendOtp(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
