import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}",
          ),
          ElevatedButton(
            child: const Text("Choisir une Date"),
            onPressed: () async {
              final DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
              );
              if (dateTime != null) {
                setState(() {
                  selectedDate = dateTime;
                });
              }
            },
          )
        ],
      )
    );
  }
}
