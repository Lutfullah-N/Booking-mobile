import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Row(
              children: [
                Column(
                  children: [
                    Text('Bookign Type'),
                    SizedBox(
                      width: 20,
                    ),
                    Text('flight'),
                  ],
                ),
                Column(
                  children: [
                    Text('Booking details'),
                    SizedBox(
                      width: 20,
                    ),
                    Text('flight'),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                TextButton(onPressed: () {}, child: Text('Discounted')),
                TextButton(onPressed: () {}, child: Text('Apply'))
              ],
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              child: Divider(
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [Text('Totla Price'), Text('231USD')],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Payment Methods"),
            Row(
              children: [
                Image.asset(''),
                Text('Zalo pay'),
                Icon(Icons.keyboard_arrow_right_sharp)
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Image.asset(''),
                Text('Zalo pay'),
                Icon(Icons.keyboard_arrow_right_sharp)
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Image.asset(''),
                Text('Zalo pay'),
                Icon(Icons.keyboard_arrow_right_sharp)
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Image.asset(''),
                Text('Zalo pay'),
                Icon(Icons.keyboard_arrow_right_sharp)
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text('Complete Your payment in '),
                Text('a timer 34.00')
              ],
            ),
            SizedBox(
              height: 12,
            ),
            TextButton(onPressed: () {}, child: Text('Continue'))
          ],
        ),
      ),
    );
  }
}
