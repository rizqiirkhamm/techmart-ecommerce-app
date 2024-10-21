import 'package:ecommerce_techmart/features/home/page/index/page.dart'; // Pastikan Anda mengimpor MyHomePage
import 'package:ecommerce_techmart/forget_password.dart';
import 'package:ecommerce_techmart/sign_up.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Image.asset(
                   "assets/images/logotech.png",
                    height: 100,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Text(
                    "Sign In",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  // Menghapus Form
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Phone',
                      filled: true,
                      fillColor: Color(0xFFF5FCF9),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0 * 1.5, vertical: 16.0),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                        BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Color(0xFFF5FCF9),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0 * 1.5, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                          BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFF00BF6D),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Sign in"),
                  ),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(),
                          ),
                        );
                      };
                    },
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.64),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text.rich(
                      const TextSpan(
                        text: "Don’t have an account? ",
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(color: Color(0xFF00BF6D)),
                          ),
                        ],
                      ),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.64),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
