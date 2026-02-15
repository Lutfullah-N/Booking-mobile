import 'package:booking/features/auth/widgets/snack_bar.dart';
import 'package:booking/shared/extras/prograss_idicator.dart';
import 'package:booking/shared/widgets/splite_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          padding: EdgeInsets.all(24.0),
          child: SingleChildScrollView(child: RegistrationForm()),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.blueAccent),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _userNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  // late String _email, _password, _confirmPassword
  // ignore: unused_field
  bool _isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String _mapAuthError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is Alread Registered.';
      case 'weak-password':
        return 'use strong password and the passowrd must be at least 6 characters.';
      case 'invalid-email':
        return 'Please enter a valid Email Address';
      default:
        return 'Registration failed. please try again';
    }
  }

  Future<void> saveUserProfile(User user) async {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'email': user.email,
      'username': _userNameController.text.trim(),
      'CreatedAt': FieldValue.serverTimestamp(),
      'displayName': user.email,
      'avatorURL': '',
    });
  }

  // ignore: unused_element
  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      // ignore: non_constant_identifier_names
      final UserCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
      User? user = UserCredential.user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Verify Your Email'),
              content: Text(
                'A verification email has been sent to ${user.email}.'
                'Please check your inbox and click the link to verify.',
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await user.sendEmailVerification();
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Verification email Resent'),
                      ),
                    );
                  },
                  child: const Text('Resend'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Registered Successfully! Please check you Email for Verification.',
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_mapAuthError(e.code))));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Create Account',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              TextFormField(decoration: _inputDecoration('Email', Icons.email)),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: _inputDecoration('Password', Icons.password),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: _inputDecoration(
                  'Confirm Password',
                  Icons.password_outlined,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 160,
                child: IconButton(
                  onPressed: () async {
                    _register();
                    // ProgressOverlay.show(context, message: 'Signing up...');
                    await Future.delayed(const Duration(seconds: 3));
                    // ignore: use_build_context_synchronously
                    // ProgressOverlay.hide(context);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registered Successfylly!')),
                    );
                    // showSnackBar(
                    //   // ignore: use_build_context_synchronously
                    //   context,
                    //   "If you have already had an account you can navigate to log in from options button!",
                    // );
                  },
                  icon: Icon(Icons.app_registration),
                ),
              ),
              SizedBox(height: 20),
              // const SplitButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
