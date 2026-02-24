import 'package:booking/features/home/widgets/card_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _notificationCount = 1;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed('/login');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged out Successfully')),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      // ✅ Drawer belongs here
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Nihan'),
            accountEmail: const Text('nihantagon@gmail.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.blue,
              ),
            ),
            decoration: const BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/userprofile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Example logout action
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Logged out')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                JsonCardExample(),
                SizedBox(height: 20),
                JsonCardExample(),
              ],
            ));
      case 1:
        return const Center(
          child: Text('Search page'),
        );
      case 2:
        return const Center(child: Text('Booking Page'));
      case 3:
        return const Center(
          child: Text('Profile Page'),
        );
      default:
        return const Center(
          child: Text('Page not found'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: AppBar(title: const Text('Welcome Back'), actions: [
        Badge(
          label: Text(_notificationCount.toString()),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          offset: Offset(-1, 4),
          child: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'you Have $_notificationCount new notifications.',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.notifications),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/search');
            },
            icon: Icon(Icons.search))
      ]),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined), label: 'Bookings'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'You'),
          ]),
    );
  }
}
