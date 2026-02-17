import 'package:flutter/material.dart';

class SplitButton extends StatelessWidget {
  const SplitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blue,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Options',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            onSelected: (value) {
              if (value == 'Sign in') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sign in selected')),
                );
              } else if (value == 'Sign up') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sign up selected')),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                value: 'Sign in',
                child: ListTile(
                  leading: Icon(Icons.login),
                  title: Text('Sign in'),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/register');
                },
                value: 'Sign up',
                child: const ListTile(
                  leading: Icon(Icons.person_add),
                  title: Text('Sign up'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
