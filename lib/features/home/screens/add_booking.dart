import 'package:booking/features/home/widgets/booking_form.dart';
import 'package:flutter/material.dart';

class AddBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Booking'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            BookingForm(),
          ],
        ),
      ),
    );
  }
}
