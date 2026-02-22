import 'package:booking/features/home/widgets/date_time_picker.dart';
import 'package:flutter/material.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookingForm createState() => _BookingForm();
}

class _BookingForm extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Title(color: Colors.white, child: Text('hi'));
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter the value Con not be empty';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          DateTimePickerScreen(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Proccessing Data')),
                    );
                  }
                },
                child: const Text('Submit')),
          )
        ],
      ),
    );
  }
}
