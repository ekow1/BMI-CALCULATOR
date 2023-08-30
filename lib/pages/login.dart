import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/form.dart';
import '../../components/header.dart';
import '../components/button_auth.dart';
import '../components/button_text.dart';
import 'input.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  void tap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const RegisterPage(),
      ),
    );
  }

  bool validate() {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      return true;
    } else {
      return false;
    }
  }

  void navigate() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const InputPage(),
      ),
    );
  }

  void popup(text, color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
        elevation: 6,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    if (!validate()) {
      return; // Return early if fields are empty
    }

    spin();
    try {
      final auth = FirebaseAuth.instance;
      final userCredential = await auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Check if the login was successful
      if (userCredential.user != null) {
        hideSpinner();
        showSnackBar('Login successful', Colors.teal);
        navigate();
      } else {
        hideSpinner();
        showSnackBar(
          'Login failed. Please check your email and password.',
          Colors.red.shade900,
        );
      }
    } catch (err) {
      hideSpinner();
      showSnackBar(
        'An error occurred during login. Please try again later.',
        Colors.red.shade900,
      );
    }
  }

  void spin() {
    // Show the spinner
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing the dialog
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
            backgroundColor: Colors.white,
            strokeWidth: 2.0,
          ),
        );
      },
    );
  }

  void hideSpinner() {
    // Hide the spinner
    Navigator.of(context, rootNavigator: true).pop(); // Dismiss the dialog
  }

  void showSnackBar(String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
        elevation: 6,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                const Header(
                  text: 'welcome back , you\'ve been missed',
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      InputField(
                        obscureText: false,
                        label: 'email',
                        controller: _emailController,
                        validate: (value) =>
                            value.isEmpty ? "Email cannot be empty" : null,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      InputField(
                        obscureText: true,
                        label: 'password',
                        controller: _passwordController,
                        validate: (value) =>
                            value.isEmpty ? "Password cannot be empty" : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'forgot password?',
                        style: GoogleFonts.josefinSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Button(
                  text: 'sign in',
                  onTap: loginUser,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                BottomText(
                  action: 'Register',
                  textDesc: 'Not a member?',
                  onTap: tap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
