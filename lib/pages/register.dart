import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../components/form.dart';
import '../../components/header.dart';
import '../../provider/auth_provider.dart';
import '../components/button_auth.dart';
import '../components/button_text.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  // final _passwordConfirmController = TextEditingController();
  final _key = GlobalKey<FormState>();

  void tap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const LoginPage(),
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

  bool validate() {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      return true;
    } else {
      return false;
    }
  }

  void spin() {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
              backgroundColor: Colors.white,
              strokeWidth: 2.0,
            ),
          );
        });
  }

  Future<void> register() async {
    if (!validate()) {
      return; // Return early if fields are empty
    }

    spin();
    try {
      await Provider.of<AuthProvider>(context, listen: false).register(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
      );

      hideSpinner();

      showSnackBar('Registration successful', Colors.teal);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    } catch (err) {
      hideSpinner();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            err.toString(),
          ),
        ),
      );
    }
  }

  // void spin() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return Center(
  //         child: CircularProgressIndicator(
  //           valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
  //           backgroundColor: Colors.white,
  //           strokeWidth: 2.0,
  //         ),
  //       );
  //     },
  //   );
  // }

  void hideSpinner() {
    Navigator.of(context, rootNavigator: true).pop();
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
                  text: 'Register by filling in the required information',
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
                        label: 'full name',
                        controller: _nameController,
                        validate: (value) =>
                            value!.isEmpty ? "Name cannot be empty" : null,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      InputField(
                        obscureText: false,
                        label: 'email',
                        controller: _emailController,
                        validate: (value) =>
                            value!.isEmpty ? "Email cannot be empty" : null,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      InputField(
                        obscureText: true,
                        label: 'password',
                        controller: _passwordController,
                        validate: (value) =>
                            value!.isEmpty ? "Password cannot be empty" : null,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // InputField(
                      //   label: 'confirm password',
                      //   controller: _passwordConfirmController,
                      //   validate: (value) =>
                      //       value!.isEmpty ? "Password cannot be empty" : null,
                      // )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Button(
                  text: 'sign up',
                  onTap: register,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BottomText(
                  action: 'Login ',
                  textDesc: 'Already have an account ?',
                  onTap: tap, // Remove the parentheses here
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
