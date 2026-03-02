import 'package:flutter/material.dart';

class DateTimePickerScreen extends StatefulWidget {
  final Function(String) onDateTimeSelected;

  const DateTimePickerScreen({super.key, required this.onDateTimeSelected});

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  int selectedDateIndex = 2;
  int selectedTimeIndex = 1;

  final List<int> days = [8, 9, 10, 11, 12];
  final List<String> times = ["11:05", "14:15", "16:30"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "Select Date & Time",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 25),

        // Horizontal Date Selector
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (context, index) {
              final bool isSelected = selectedDateIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDateIndex = index;
                  });
                  widget.onDateTimeSelected("Dec ${days[index]}");
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 70,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.yellow : Colors.grey[600],
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Dec",
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      const SizedBox(height: 8),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.grey[700],
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          days[index].toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),

        // Time Slots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(times.length, (index) {
            final bool isSelected = selectedTimeIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTimeIndex = index;
                });
                widget.onDateTimeSelected(times[index]);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.grey[600],
                  borderRadius: BorderRadius.circular(25),
                  border: isSelected
                      ? Border.all(color: Colors.yellow, width: 2)
                      : null,
                ),
                child: Text(
                  times[index],
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
