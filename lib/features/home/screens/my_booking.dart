import 'package:flutter/material.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key});

  @override
  State<StatefulWidget> createState() => _MyBooking();
}

class _MyBooking extends State<MyBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Booking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset(
                        width: 40, height: 100, 'assets/images/hotel.png'),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Title'),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.watch_later),
                      SizedBox(
                        width: 5,
                      ),
                      Text("14h 45min - 12.02.2026")
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset(
                        width: 40, height: 100, 'assets/images/hotel.png'),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Title'),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.watch_later),
                      SizedBox(
                        width: 5,
                      ),
                      Text("14h 45min - 12.02.2026")
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset(
                        width: 40, height: 100, 'assets/images/hotel.png'),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Title'),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.watch_later),
                      SizedBox(
                        width: 5,
                      ),
                      Text("14h 45min - 12.02.2026")
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
