import 'package:cashier_assistant/components/button.dart';
import 'package:cashier_assistant/components/icon_button.dart';
import 'package:cashier_assistant/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cashier_assistant/pages/register_page.dart';
// import 'package:cashier_assistant/pages/otp_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../services/auth_services.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // handle onchange text
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final storage = FlutterSecureStorage();
  final AuthServices authServices = AuthServices();

  // handle button
  Future<void> handleSignIn(context) async {
    debugPrint('Username: ${usernameController.text}');
    debugPrint('Password: ${passwordController.text}');

    final res = await authServices.login(
      usernameController.text,
      passwordController.text,
    );

    debugPrint('Response: $res');

    if (res['status'] == 'success') {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Login Success',
        text: res['message'],
      );

      await storage.write(key: 'auth_token', value: res['token']);
    } else if (res['status'] == 'failed') {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Login Failed',
        text: res['message'],
      );
    }

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => OtpPage()),
    // );

    // await storage.write(key: 'auth_token', value: fakeJwtToken);

    // debugPrint('Fake JWT Token: $fakeJwtToken');
  }

  Future<void> handleForgotPassword(BuildContext context) async {
    // Implement your forgot password logic here

    // QuickAlert.show(
    //   context: context,
    //   type: QuickAlertType.info,
    //   title: 'Forgot Password',
    //   text: 'Password reset instructions have been sent to your email.',
    // );

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => OtpPage()),
    // );

    String? token = await storage.read(key: 'auth_token');
    if (token != null) {
      final decodedToken = JwtDecoder.decode(token);

      debugPrint('Decoded Token: $decodedToken');
      DateTime expiryDate =
          DateTime.fromMillisecondsSinceEpoch(decodedToken['exp'] * 1000);
      debugPrint(
          'Token Expiry Date: ${expiryDate.toLocal().toString().split('.')[0]}');
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
                const SizedBox(
                  height: 25,
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
                  height: 25,
                ),

                // welcome text
                Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),

                const SizedBox(
                  height: 25,
                ),

                // username text field
                InputField(
                  controller: usernameController,
                  hintText: 'Username or Email',
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

                // forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => handleForgotPassword(context),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 25,
                ),

                // sign in button
                CustomButton(
                  text: 'Sign In',
                  onTap: () => handleSignIn(context),
                ),

                const SizedBox(
                  height: 25,
                ),

                // or continue with
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 25,
                ),

                // google & apple sign in
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomIconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.google,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  CustomIconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.apple,
                      size: 40,
                    ),
                  ),
                ]),

                const SizedBox(
                  height: 25,
                ),

                // register option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
