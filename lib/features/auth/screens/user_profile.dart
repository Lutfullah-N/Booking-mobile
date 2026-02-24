import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png'),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit_square)),
              SizedBox(height: 30),
              Text('Ali R'),
              Row(
                children: [
                  Expanded(child: Icon(Icons.phone)),
                  Text('+935635636'),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(child: Icon(Icons.email)),
                  Text('alir@exmapl.com')
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                  child: Divider(
                thickness: 1,
              )),
              Row(
                children: [
                  Expanded(child: Icon(Icons.book_outlined)),
                  TextButton(onPressed: () {}, child: Text('My Booking')),
                  Expanded(child: Icon(Icons.arrow_right)),
                  SizedBox(height: 10),
                  Expanded(child: Icon(Icons.translate)),
                  TextButton(onPressed: () {}, child: Text('Change Language')),
                  Expanded(child: Icon(Icons.arrow_right)),
                  SizedBox(height: 10),
                  Expanded(child: Icon(Icons.lock)),
                  TextButton(onPressed: () {}, child: Text('Change Password')),
                  Expanded(child: Icon(Icons.arrow_right)),
                  SizedBox(height: 10),
                  Expanded(child: Icon(Icons.touch_app)),
                  TextButton(onPressed: () {}, child: Text('Face/Touch Id')),
                  // Expanded(child: ToggleButtons(children: , isSelected: ()P)),
                  SizedBox(height: 10),
                ],
              ),
              // const BottomNavBar();
            ],
          ),
        ),
      ),
    );
  }
}
