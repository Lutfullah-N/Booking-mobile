import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bookings {
  final String id;
  final String title;
  final String date;
  // ignore: non_constant_identifier_names
  final String ImageUrl;

  Bookings({
    required this.id,
    required this.title,
    required this.date,
    // ignore: non_constant_identifier_names
    required this.ImageUrl,
  });
  factory Bookings.fromJson(Map<String, dynamic> json) {
    return Bookings(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      ImageUrl: json['ImageUrl'],
    );
  }
}

class BookingSoon extends StatefulWidget {
  const BookingSoon({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _BookingSoonState createState() => _BookingSoonState();
}

class _BookingSoonState extends State<BookingSoon> {
  List<Bookings> bookings = [];

  @override
  void initState() {
    super.initState();
    fetchBooking();
  }

  Future<void> fetchBooking() async {
    final response = await rootBundle.loadString('assets/bookings.json');
    final List<dynamic> data = json.decode(response);
    print(data);
    setState(() {
      bookings = data.map((json) => Bookings.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Comming Soon')),
        body: bookings.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8),
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  return GestureDetector(
                      onTap: () {
                        if (booking.title == 'Current Service') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const Navigator() /*ComingSoonPage()*/,
                              ));
                        }
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12)),
                                child: Image.asset(
                                  booking.ImageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              booking.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Location: ${booking.date}'),
                            const SizedBox(height: 8),
                            // Text("price: ${booking.cost}")
                          ],
                        ),
                      ));
                },
              ));
  }
}
