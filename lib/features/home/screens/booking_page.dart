import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:booking/features/home/models/property.dart';
import 'package:booking/features/home/widgets/current_booking.dart';

class BookingPage extends StatefulWidget {
  final bool isComingSoon;

  const BookingPage({
    super.key,
    required this.isComingSoon,
  });

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<Property> properties = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String response =
        await rootBundle.loadString('assets/booking.json');
    final List<dynamic> data = json.decode(response);

    final allProperties =
        data.map((json) => Property.fromJson(json)).toList();

    setState(() {
      properties = allProperties
          .where((p) => p.isComingSoon == widget.isComingSoon)
          .toList();
      isLoading = false;
    });
  }

  void navigateTo(bool comingSoon) {
    if (comingSoon == widget.isComingSoon) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BookingPage(isComingSoon: comingSoon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Bookings"),
      ),
      body: Column(
        children: [
          // 🔥 TOP BUTTONS
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTopButton(
                  title: "Current Booking",
                  isActive: !widget.isComingSoon,
                  onTap: () => navigateTo(false),
                ),
                const SizedBox(width: 16),
                _buildTopButton(
                  title: "Coming Soon",
                  isActive: widget.isComingSoon,
                  onTap: () => navigateTo(true),
                ),
              ],
            ),
          ),

          const Divider(),

          // 🔥 PAGE CONTENT
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : properties.isEmpty
                    ? const Center(child: Text("No properties found"))
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: properties
                              .map((property) =>
                                  CurrentBooking(property: property))
                              .toList(),
                        ),
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopButton({
    required String title,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isActive ? Colors.greenAccent : Colors.grey[300],
        foregroundColor: isActive ? Colors.black : Colors.black54,
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }
}