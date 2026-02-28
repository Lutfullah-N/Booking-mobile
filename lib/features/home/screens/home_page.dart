import 'dart:convert';
import 'package:booking/features/home/models/property.dart';
import 'package:booking/features/home/widgets/current_booking.dart';
import 'package:booking/shared/extras/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

// inside _HomePage
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Property> properties = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/booking.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      properties = data.map((json) => Property.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text('user name'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('User Profile'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/userprofile');
                },
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Welcome back 🍏",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              sectionTitle("Now Playing"),
              properties.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: properties
                            .map((property) =>
                                CurrentBooking(property: property))
                            .toList(),
                      ),
                    ),
              sectionTitle('Coming Soon'),
              properties.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: properties
                            .map((property) =>
                                CurrentBooking(property: property))
                            .toList(),
                      ),
                    ),
              sectionTitle("Promo & Discount"),
              promoBanner(),
              sectionTitle("Service"),
              serviceIcons(),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNav(currentIndex: 0));
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget promoBanner() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      color: Colors.yellow[700],
      child: Center(
        child: Text("🍿 30% OFF", style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget serviceIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(children: [Icon(Icons.bookmark_add), Text("Bookings")]),
        Column(children: [Icon(Icons.fastfood), Text("Food")]),
        Column(children: [Icon(Icons.emoji_transportation), Text("Transport")]),
      ],
    );
  }
}
