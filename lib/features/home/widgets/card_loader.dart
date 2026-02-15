import 'package:booking/features/home/widgets/home_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class JsonCardExample extends StatefulWidget {
  const JsonCardExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JsonCardExampleState createState() => _JsonCardExampleState();
}

class _JsonCardExampleState extends State<JsonCardExample> {
  User? user;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      final dataString = await rootBundle.loadString('assets/data.json');
      final jsonData = json.decode(dataString);

      if (jsonData is List && jsonData.isNotEmpty) {
        final first = Map<String, dynamic>.from(jsonData[0]);
        setState(() {
          user = User.fromJson(first);
        });
      } else if (jsonData is Map<String, dynamic>) {
        setState(() {
          user = User.fromJson(jsonData);
        });
      } else {
        debugPrint('Unexpected JSON format in assets/data.json');
      }
    } catch (e) {
      debugPrint('Failed to load asset JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reach Future")),
      body: Center(
        child: user == null
            ? CircularProgressIndicator()
            : Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          user!.imageUrl,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        user!.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text("Email: ${user!.email}"),
                      SizedBox(height: 6),
                      Text("cost: ${user!.phone} USD"),
                      SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          // Example action
                        },
                        child: Text("Book Now"),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
