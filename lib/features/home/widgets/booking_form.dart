import 'package:flutter/material.dart';

class BookingForm extends StatefulWidget {
  final Function(String) onTitleChanged;
  final Function(String) onServiceChanged;
  final Function(String) onCostChanged;
  final Function(String) onLocationChanged;
  const BookingForm(
      {super.key,
      required this.onTitleChanged,
      required this.onServiceChanged,
      required this.onCostChanged,
      required this.onLocationChanged});
  @override
  State<BookingForm> createState() => _BookingForm();
}

class _BookingForm extends State<BookingForm> {
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Name"),
            onChanged: widget.onTitleChanged,
            validator: (value) => value == null || value.isEmpty
                ? "Enter the name of Booking"
                : null,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Service Type"),
            onChanged: widget.onServiceChanged,
            validator: (value) => value == null || value.isEmpty
                ? "Enter the Service Type"
                : null,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Cost"),
            keyboardType: TextInputType.number,
            onChanged: widget.onCostChanged,
            validator: (value) => value == null || value.isEmpty
                ? "Enter the Price of Service"
                : null,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Location"),
            onChanged: widget.onLocationChanged,
            validator: (value) =>
                value == null || value.isEmpty ? "Enter The location" : null,
          )
        ],
      ),
    );
  }
}
