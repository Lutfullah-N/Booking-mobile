import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RegistrationForm(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/phoneSignUp');
                    },
                    child: Text('Sign up Options')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: Text('Sign in')),
              ],
            )
          ],
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
  // ignore: unused_field
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  Future<String> uploadProfileImage(File imageFile, String userId) async {
    final ref =
        FirebaseStorage.instance.ref().child("profile_images/$userId.jpg");
    await ref.putFile(imageFile);
    return await ref.getDownloadURL();
  }

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
  late final TextEditingController _ruleController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _imageController;
  // late String _email, _password, _confirmPassword
  // ignore: unused_field
  bool _isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _userNameController = TextEditingController();
    _ruleController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _imageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _ruleController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _imageController.dispose();
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
      'rule': _ruleController.text.trim(),
      'CreatedAt': FieldValue.serverTimestamp(),
      'avatorURL': '',
    });
  }

  // ignore: unused_element
  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      // ignore: non_constant_identifier_names
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      User? user = userCredential.user;
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
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _userNameController,
                validator: (value) =>
                    value!.isEmpty ? 'Enter your Showing Name' : null,
                decoration: _inputDecoration('userName', Icons.person),
              ),
              SizedBox(height: 20),
              TextFormField(
                  controller: _emailController,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your Valide Email Address' : null,
                  decoration: _inputDecoration('Email', Icons.email)),
              SizedBox(height: 20),
              TextFormField(
                controller: _ruleController,
                validator: (value) => value!.isEmpty
                    ? "Enter your Rule basd on your Activity"
                    : null,
                decoration: _inputDecoration('rule(user/provider)', Icons.rule),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                validator: (value) =>
                    value!.isEmpty ? "Password must not be empty" : null,
                decoration: _inputDecoration('Password', Icons.lock),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                decoration: _inputDecoration(
                  'Confirm Password',
                  Icons.lock,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () async {
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (image != null) {
                          setState(() {
                            _profileImage = File(image.path);
                          });
                        }
                      },
                      child: Text('Upload Profile')),
                  TextButton(onPressed: () {}, child: Text('Add PSkey'))
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 160,
                child: TextButton(
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
                  child: Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
