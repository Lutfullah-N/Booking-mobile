import 'package:flutter/material.dart';

class DateTimePickerScreen extends StatefulWidget {
  final Function(String) onDateTimeSelected;

  const DateTimePickerScreen({super.key, required this.onDateTimeSelected});

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;

  late List<DateTime> dates;
  late List<String> times;

  @override
  void initState() {
    super.initState();
    dates = _generateDates();
    times = _generateFullDayHours(); // 00:00 → 23:00
  }

  /// Generate full month + 3 days from next month
  List<DateTime> _generateDates() {
    DateTime now = DateTime.now();
    DateTime firstDay = DateTime(now.year, now.month, 1);
    DateTime nextMonth = DateTime(now.year, now.month + 1, 1);

    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    List<DateTime> dateList = [];

    for (int i = 0; i < daysInMonth; i++) {
      dateList.add(firstDay.add(Duration(days: i)));
    }

    for (int i = 0; i < 3; i++) {
      dateList.add(nextMonth.add(Duration(days: i)));
    }

    return dateList;
  }

  /// Generate 24 full hours
  List<String> _generateFullDayHours() {
    List<String> hourList = [];
    for (int i = 0; i < 24; i++) {
      String hour = i.toString().padLeft(2, '0');
      hourList.add("$hour:00");
    }
    return hourList;
  }

  String _monthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "Select Date & Time",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 25),

        /// ✅ Horizontal Date Selector
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            itemBuilder: (context, index) {
              final bool isSelected = selectedDateIndex == index;
              DateTime date = dates[index];

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDateIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 50,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.yellow : Colors.grey[600],
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _monthName(date.month),
                        style: const TextStyle(color: Colors.white),
                      ),
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
                          date.day.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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

        /// ✅ Horizontal Full Hours (00:00 – 23:00)
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: times.length,
            itemBuilder: (context, index) {
              final bool isSelected = selectedTimeIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTimeIndex = index;
                  });

                  final selectedDate = dates[selectedDateIndex];
                  final selectedTime = times[selectedTimeIndex];

                  widget.onDateTimeSelected(
                      "${_monthName(selectedDate.month)} ${selectedDate.day} $selectedTime");
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
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
            },
          ),
        ),
      ],
    );
  }
}
