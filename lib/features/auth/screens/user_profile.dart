import 'package:booking/shared/widgets/main_nav_button.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Profile")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Profile Image
              Image.asset('assets/images/logo.png', height: 100),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_square),
              ),

              const SizedBox(height: 10),

              const Text(
                'Ali R',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Phone
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.phone),
                  SizedBox(width: 10),
                  Text('+935635636'),
                ],
              ),

              const SizedBox(height: 10),

              // Email
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.email),
                  SizedBox(width: 10),
                  Text('alir@example.com'),
                ],
              ),

              const SizedBox(height: 30),
              const Divider(),

              // Settings Options
              ListTile(
                leading: const Icon(Icons.book_outlined),
                title: const Text('My Booking'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, '/myBooking');
                },
              ),

              ListTile(
                leading: const Icon(Icons.translate),
                title: const Text('Change Language'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),

              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Change Password'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),

              SwitchListTile(
                secondary: const Icon(Icons.touch_app),
                title: const Text('Face/Touch ID'),
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNav(currentIndex: 2));
  }
}
