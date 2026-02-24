import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _userNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _ruleController;
  late final TextEditingController _passwordController;
  bool _isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _userNameController = TextEditingController();
    _ruleController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _ruleController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.blueAccent),
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      ),
    );
  }

  String _mapAuthError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'weak-password':
        return 'Password must be at least 6 characters.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      default:
        return 'Registration failed. Please try again.';
    }
  }

  Future<String> uploadProfileImage(File imageFile, String userId) async {
    final ref =
        FirebaseStorage.instance.ref().child("profile_images/$userId.jpg");
    await ref.putFile(imageFile);
    return await ref.getDownloadURL();
  }

  Future<void> saveUserProfile(User user) async {
    String avatarUrl = '';
    if (_profileImage != null) {
      avatarUrl = await uploadProfileImage(_profileImage!, user.uid);
    }

    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'email': user.email,
      'username': _userNameController.text.trim(),
      'rule': _ruleController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
      'avatarURL': avatarUrl,
    });
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      User? user = userCredential.user;

      if (user != null) {
        await saveUserProfile(user);

        if (!user.emailVerified) {
          await user.sendEmailVerification();
          if (!mounted) return;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Verify Your Email'),
                content: Text(
                  'A verification email has been sent to ${user.email}. '
                  'Please check your inbox and click the link to verify.',
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      await user.sendEmailVerification();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Verification email resent')),
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
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Registered successfully! Please verify your email.')),
      );
      await saveUserProfile(user!);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_mapAuthError(e.code))),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: _formKey,
      child: Card(
        elevation: 8.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Create Account',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _userNameController,
                validator: (value) =>
                    value!.isEmpty ? 'Enter your display name' : null,
                decoration: _inputDecoration('Username', Icons.person),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter your email';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                decoration: _inputDecoration('Email', Icons.email),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ruleController,
                validator: (value) => value!.isEmpty ? "Enter your role" : null,
                decoration:
                    _inputDecoration('Role (user/provider)', Icons.rule),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                validator: (value) =>
                    value!.isEmpty ? "Password must not be empty" : null,
                decoration: _inputDecoration('Password', Icons.lock),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                decoration: _inputDecoration('Confirm Password', Icons.lock),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : null,
                    child: _profileImage == null
                        ? const Icon(Icons.person, size: 30)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  TextButton(
                    onPressed: () async {
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        setState(() => _profileImage = File(image.path));
                      }
                    },
                    child: const Text('Upload Profile'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _register,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Register'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signOptUp');
                    },
                    child: const Text('Sign up Options'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: const Text('Sign in'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
