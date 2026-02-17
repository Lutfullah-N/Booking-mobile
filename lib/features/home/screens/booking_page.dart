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

class BookingListPage extends StatefulWidget {
  const BookingListPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _BookingListPageState createState() => _BookingListPageState();
}

class _BookingListPageState extends State<BookingListPage> {
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
        appBar: AppBar(title: Text('My Bookings')),
        body: bookings.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  return Card(
                    margin: EdgeInsets.all(12),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          booking.ImageUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        booking.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Date: ${booking.date}'),
                      onTap: () {},
                    ),
                  );
                },
              ));
  }
}
