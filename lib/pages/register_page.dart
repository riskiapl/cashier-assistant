import 'package:cashier_assistant/components/button.dart';
import 'package:cashier_assistant/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:cashier_assistant/pages/login_page.dart';
import 'package:quickalert/quickalert.dart';
import 'package:cashier_assistant/services/auth_services.dart';
import 'package:cashier_assistant/pages/otp_page.dart';
import 'package:rxdart/rxdart.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final AuthServices authServices = AuthServices();

  final _usernameSubject = BehaviorSubject<String>();
  bool? _isUsernameAvailable;

  @override
  void initState() {
    super.initState();

    // Cek ketersediaan username dengan debounce menggunakan RxDart
    _usernameSubject
        .debounceTime(Duration(milliseconds: 500))
        .listen((username) async {
      if (username.isNotEmpty) {
        final isAvailable = await authServices.isUsernameAvailable(username);
        setState(() {
          _isUsernameAvailable = isAvailable;
        });
      } else {
        setState(() {
          _isUsernameAvailable = null;
        });
      }
    });

    usernameController.addListener(() {
      _usernameSubject.add(usernameController.text);
    });
  }

  Future<void> handleRegister(BuildContext context) async {
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

    final res = await authServices.register(
      usernameController.text,
      emailController.text,
      passwordController.text,
    );

    if (res['status'] == 'success') {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OtpPage()),
        );
      }
    } else if (res['status'] == 'failed') {
      if (context.mounted) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Registration Failed',
          text: res['message'],
        );
      }
    }
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool arePasswordsEqual(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  @override
  void dispose() {
    _usernameSubject.close();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),
                  const Icon(
                    Icons.point_of_sale,
                    size: 100,
                    color: Colors.black,
                  ),
                  Text(
                    'Cashier Assistant',
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Create a new account',
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  const SizedBox(height: 25),
                  InputField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  Stack(
                    children: [
                      InputField(
                        controller: usernameController,
                        hintText: 'Username',
                        obscureText: false,
                      ),
                      if (_isUsernameAvailable != null)
                        Positioned(
                          right: 10,
                          top: 15,
                          child: Icon(
                            _isUsernameAvailable!
                                ? Icons.check_circle
                                : Icons.error,
                            color: _isUsernameAvailable!
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  InputField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  InputField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    text: 'Register',
                    onTap: () => handleRegister(context),
                  ),
                  const SizedBox(height: 25),
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
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
