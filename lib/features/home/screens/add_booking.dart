import 'package:booking/features/home/widgets/booking_form.dart';
import 'package:booking/features/home/widgets/date_time_picker.dart';
import 'package:flutter/material.dart';

class AddBooking extends StatelessWidget {
  const AddBooking({super.key});

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
            SizedBox(
              height: 20,
            ),
            DateTimePickerScreen(),
            SizedBox(height: 10),
            TextButton(onPressed: () {}, child: Text('Done')),
            // BottomNavBar();
          ],
        ),
      ),
    );
  }
}
