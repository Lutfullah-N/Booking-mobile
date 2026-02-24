import 'package:flutter/material.dart';

class MyBookingDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyBookingDetails();
}

class _MyBookingDetails extends State<MyBookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/logo.png'),
                Expanded(
                  child: Column(
                    children: [
                      Text('Booking Topic :'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Topic Details'),
                      SizedBox(
                        child: Column(
                          children: [
                            Icon(Icons.timer),
                            SizedBox(
                              width: 2,
                            ),
                            Text('23 Hourse'),
                            SizedBox(
                              width: 2,
                            ),
                            Text('34 minutes')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Icon(Icons.calendar_month_rounded),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Row(
                  children: [
                    Text('14h15'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('02.23.2026')
                  ],
                )),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.merge_type_outlined),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Row(
                  children: [
                    Text('Section 4'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('flight No :21')
                  ],
                ))
              ],
            ),
            SizedBox(
                child: Divider(
              color: Colors.red,
              thickness: 2,
            )),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.price_check,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(child: Text('2134341 \$/')),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Kabul Afganistan'),
                    Container(
                      padding: const EdgeInsets.all(2),
                      width: 13,
                      height: 10,
                      child: Text('AFG'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        'Exact Location for the or address of city. like G.O location'),
                  ],
                )),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.text_snippet_outlined,
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 12),
                Text('you Can cancel your pending bookings'),
              ],
            ),
            SizedBox(
              child: Divider(
                thickness: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
