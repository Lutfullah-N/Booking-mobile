import 'package:flutter/material.dart';

class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() => _BookingDetailsPage();
}

class _BookingDetailsPage extends State<BookingDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(2),
              child: Image.asset('assets/images/hotel.png'),
            ),
            Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.black,
              child: Card(
                child: Row(
                  children: [
                    const Text(
                      'Title: booking Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.black,
                // borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  const Text('Booking Type'),
                  Expanded(child: const Text('Flight')),
                  SizedBox(
                    height: 5,
                  ),
                  const Text('Booking count'),
                  Expanded(child: const Text('23+')),
                  SizedBox(
                    height: 5,
                  ),
                  const Text('BookingPrice'),
                  Expanded(child: const Text('20 \$/')),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('About'),
            SizedBox(
              height: 20,
            ),
            const Text(
                'allow the user to scroll through the content. This is often used for long pages or when the keyboard appears and causes a bottom'),
            SizedBox(
              height: 10,
            ),
            const Text('Provider'),
            Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(2),
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(
                    width: 2,
                  ),
                  const Text('provider Name')
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text('Location/Type'),
            // Container(
            //   child: Card(
            //     child
            //   ),
            // )
            SizedBox(
              height: 15,
            ),
            TextButton(onPressed: () {}, child: Text('Continue')),
            // BottomNavigationBar(items: BottomNavigationBarItem(icon: icon))
          ],
        ),
      ),
    );
  }
}
