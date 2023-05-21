import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDate = DateTime.now();
  String _zone = 'WIB';
  late String _timeString;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 10), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now =
        DateTime.now().toUtc().add(Duration(hours: _getHourOffset()));
    setState(() {
      _timeString = '${DateFormat('HH:mm:ss').format(now)} $_zone';
    });
  }

  int _getHourOffset() {
    if (_zone == "WIB") {
      return 7;
    } else if (_zone == "WITA") {
      return 8;
    } else if (_zone == "WIT") {
      return 9;
    } else if (_zone == "UTC") {
      return 1;
    } else {
      return 0;
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalender dan Jam Digital'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat.yMMMMEEEEd().format(_selectedDate),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Centaur',
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),
            SizedBox(height: 16),
            Text(
              _timeString,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Centaur',
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: _zone,
              onChanged: (String? newValue) {
                setState(() {
                  _zone = newValue!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'WIB',
                  child: Text('WIB'),
                ),
                DropdownMenuItem(
                  value: 'WITA',
                  child: Text('WITA'),
                ),
                DropdownMenuItem(
                  value: 'WIT',
                  child: Text('WIT'),
                ),
                DropdownMenuItem(
                  value: 'London',
                  child: Text('LONDON'),
                ),
              ],
              style: TextStyle(color: Colors.black),
              dropdownColor: Colors.white,
              underline: Container(
                height: 2,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
