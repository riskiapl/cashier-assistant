import 'package:cashier_assistant/components/button.dart';
import 'package:cashier_assistant/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:cashier_assistant/pages/login_page.dart';
import 'package:quickalert/quickalert.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // handle onchange text
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // handle button
  void handleRegister(BuildContext context) {
    // input validation
    if (!isValidEmail(emailController.text) ||
        usernameController.text.isEmpty ||
        !arePasswordsEqual(
            passwordController.text, confirmPasswordController.text)) {
      String errorMessage = '';
      if (!isValidEmail(emailController.text)) {
        errorMessage = 'Please enter a valid email address.';
      } else if (usernameController.text.isEmpty) {
        errorMessage = 'Please enter a username.';
      } else if (!arePasswordsEqual(
          passwordController.text, confirmPasswordController.text)) {
        errorMessage =
            'The passwords you entered do not match. Please try again.';
      }
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Registration Error',
        text: errorMessage,
      );
      return;
    }

    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Registration Successful',
      text: 'Your account has been created successfully.',
    );
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool arePasswordsEqual(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),

                // logo
                const Icon(
                  Icons.point_of_sale,
                  size: 100,
                  color: Colors.black,
                ),

                Text(
                  'Cashier Assistant',
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                ),

                const SizedBox(
                  height: 50,
                ),

                // welcome text
                Text(
                  'Create a new account',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
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
                  height: 10,
                ),

                // username text field
                InputField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(
                  height: 10,
                ),

                // password text field
                InputField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 10,
                ),

                // confirm password text field
                InputField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 25,
                ),

                // register button
                CustomButton(
                  text: 'Register',
                  onTap: () => handleRegister(context),
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                ),

                const SizedBox(
                  height: 50,
                ),

                // or login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue,
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
