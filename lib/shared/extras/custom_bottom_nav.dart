import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNav({super.key, required this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/home');
        }
        if (index == 1) {
          Navigator.pushReplacementNamed(context, '/bookings');
        }
        if (index == 2) Navigator.pushReplacementNamed(context, '/myBooking');
        // if (index == 3) Navigator.pushReplacementNamed(context, '/myBooking');
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_outlined),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'You',
        ),
      ],
    );
  }
}
