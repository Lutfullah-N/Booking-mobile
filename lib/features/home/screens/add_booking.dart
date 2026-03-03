import 'package:booking/features/home/screens/my_booking.dart';
import 'package:booking/features/home/widgets/booking_form.dart';
import 'package:booking/features/home/widgets/date_time_picker.dart';
import 'package:booking/shared/extras/custom_bottom_nav.dart';
import 'package:flutter/material.dart';

class AddBooking extends StatefulWidget {
  const AddBooking({super.key});

  @override
  State<AddBooking> createState() => _AddBookingState();
}

class _AddBookingState extends State<AddBooking> {
  String bookingTitle = "";
  String serviceType = "";
  String cost = "";
  String location = "";
  String bookingTime = "";
  String bookingStatus = "Pending";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Booking"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BookingForm(
              onTitleChanged: (val) => bookingTitle = val,
              onServiceChanged: (val) => serviceType = val,
              onCostChanged: (val) => cost = val,
              onLocationChanged: (val) => location = val,
            ),
            const SizedBox(height: 20),
            DateTimePickerScreen(
              onDateTimeSelected: (val) {
                setState(() {
                  bookingTime = val;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              ),
              onPressed: () {
                if (bookingTitle.isEmpty || bookingTime.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please complete all fields")),
                  );
                  return;
                }

                final newBooking = Booking(
                  title: bookingTitle,
                  time: bookingTime,
                  status: bookingStatus,
                  image: "assets/images/hotel.png",
                );

                Navigator.pop(context, newBooking);
              },
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: 0),
    );
  }
}
