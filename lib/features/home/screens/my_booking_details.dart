import 'package:booking/features/home/screens/my_booking.dart';
import 'package:flutter/material.dart';

class MyBookingDetails extends StatelessWidget {
  final Booking booking;
  const MyBookingDetails({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 60,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking Topic :${booking.title}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text('Details: ${booking.status}'),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text("2h 34m")
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_month_rounded,
                  size: 16,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('14h15, 10.12.2022'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.merge_type_outlined),
                SizedBox(
                  width: 8,
                ),
                Text("Section 4 • Seats H7, H8"),
              ],
            ),
            const Divider(
              thickness: 2,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.price_check,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text("210.000 VND"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(width: 8),
                Expanded(child: Text('Location: Kabul Afghanistan')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.qr_code,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "Show this QR code to the ticket counter to receive your ticket",
                  ),
                )
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
