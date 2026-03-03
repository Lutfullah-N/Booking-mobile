import 'package:booking/features/home/models/property.dart';
import 'package:flutter/material.dart';

class BookingDetailsPage extends StatefulWidget {
  final Property property;
  const BookingDetailsPage({super.key, required this.property});

  @override
  State<StatefulWidget> createState() => _BookingDetailsPage();
}

class _BookingDetailsPage extends State<BookingDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/hotel.png'),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Title: ${widget.property.title}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  // color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Booking Type: flight'),
                Text('Count: 12+'),
                Text('Price: 20 \$'),
              ],
            ),
            const SizedBox(height: 20),
            const Text('About'),
            const SizedBox(height: 8),
            const Text(
                'Allow the user to scroll through the content. this is often used for long pages...'),
            const SizedBox(height: 20),
            const Text('Provider'),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(height: 8),
                  const Text('Provider Name')
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Location/Type"),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('Continue')),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/payment');
                    },
                    child: Text(
                      'Payment',
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
