// ignore: file_names
// ignore: file_names
// import 'package:flutter/material.dart';

// class AppWrapper extends StatelessWidget {
//   const AppWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(length: 3, child: HomePage());
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>{
//   final int _notificationCount =2;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Booking System App'),
//         bottom: TabBar(tabs:[
//           Tab(
//             icon: Badge(
//               label: Text(_notificationCount.toString()),
//               backgroundColor: Colors.red,
//               textColor: Colors.white,
//               child: Icon(Icons.home),
//             ),
//             text: 'Home',
//           ),
//           Tab(
//             icon: Icon(Icons.book_online),
//             text: 'Bookings',
//           ),
//           Tab(
//             icon: Icon(Icons.person),
//             text: 'Profile',
//           )
//         ],
//         ),
//         actions: [
//           IconButton(onPressed: (){},
//            icon: Icon(Icons.settings),
//            ),
//            const SizedBox(width: 16),
//         ],
//       ),
//       body: TabBarView(
//         children: [
//           Center(child: Text('Welcome! Vewu our Latest offers'),),
//           Center(child: Text('View your upcoming and past booking here'),)
//         ],
//       ),
//     );
//   }
// }
