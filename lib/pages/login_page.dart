import 'package:cashier_assistant/components/button.dart';
import 'package:cashier_assistant/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // handle onchange text
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // handle button
  void handleSignIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // sign in button
              CustomButton(
                text: 'Sign In',
                onTap: handleSignIn,
                backgroundColor: Colors.black,
                textColor: Colors.white,
              ),

              const SizedBox(
                height: 25,
              ),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
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
              ),

              // google & apple sign in
              Row(children: [
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.apple,
                    size: 20,
                  ),
                  onPressed: () {},
                )

                // const FaIcon(
                //   FontAwesomeIcons.google,
                //   size: 20,
                // )
              ])

              // register option
            ],
          ),
        ),
      ),
    );
  }
}
