import 'package:booking/features/home/widgets/card_loader.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _notificationCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Drawer belongs here
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Icon(Icons.account_circle, size: 80, color: Colors.white),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {},
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
      ),

      appBar: AppBar(
        title: const Text('Welcome Back'),
        actions: [
          SizedBox(
            width: 5,
          ),
          Badge(
            label: Text(_notificationCount.toString()),
            backgroundColor: const Color.fromARGB(255, 54, 63, 244),
            textColor: Colors.white,
            offset: const Offset(-1, 4),
            child: IconButton(
              onPressed: () {
                // NotificationService.showNotification(
                //   title: 'New Notification',
                //   body: 'You have 0 new notifications.',
                // );
              },
              icon: const Icon(Icons.notifications),
            ),
          ),
          const SizedBox(height: 3),
          // Row(
          //   children: [
          //     TextFormField(
          //       // controller: _searchController,
          //       decoration: InputDecoration(
          //         hintText: 'Search...',
          //         prefixIcon: const Icon(Icons.search),
          //         // suffixIcon: _searchController.text.isNotEmpty
          //         //     ? IconButton(
          //         //         icon: const Icon(Icons.clear),
          //         //         onPressed: () {
          //         //           _searchController.clear();
          //         //           // Handle clear
          //         //         },
          //         //       )
          //         //     : null,
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(25.0),
          //         ),
          //       ),
          //       onChanged: (value) {
          //         // Handle search
          //       },
          //     )
          //   ],
          // )
        ],
      ),

      body: const SingleChildScrollView(
          child: Row(
        children: [
          JsonCardExample(),
          SizedBox(
            height: 20,
          ),
          // // comming Son Bookings
          // JsonCardExample(),
          // // addvertisments and services
          // JsonCardExample(),
        ],
      )),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Badge(child: Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: 'Bookings'),
          BottomNavigationBarItem(
            icon: Badge(label: Text('1'), child: Icon(Icons.person)),
            label: 'You',
          ),
        ],
      ),
    );
  }
}
