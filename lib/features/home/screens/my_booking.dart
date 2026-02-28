import 'package:flutter/material.dart';

class Booking {
  final String title;
  final String time;
  final String status;
  final String image;

  Booking({
    required this.title,
    required this.time,
    required this.status,
    required this.image,
  });
}

class MyBooking extends StatelessWidget {
  const MyBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final bookings = [
      Booking(
        title: "Hotel Paradis",
        time: "14h 45min - 12.02.2026",
        status: "Confirmed",
        image: "assets/images/hotel.png",
      ),
      Booking(
        title: "City Inn",
        time: "10h 30min - 15.03.2026",
        status: "Pending",
        image: "assets/images/hotel.png",
      ),
      Booking(
        title: "Resort Deluxe",
        time: "18h 00min - 20.04.2026",
        status: "Canceled",
        image: "assets/images/hotel.png",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Booking'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  booking.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                booking.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.watch_later, size: 16),
                      const SizedBox(width: 5),
                      Text(booking.time),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Chip(
                    label: Text(booking.status),
                    backgroundColor: _statusColor(booking.status).shade100,
                    labelStyle: TextStyle(
                      color: _statusColor(booking.status),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Helper method to map status to color
  MaterialColor _statusColor(String status) {
    switch (status) {
      case "Confirmed":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "Canceled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
