import 'package:flutter/material.dart';

import '../option_fields.dart';

class SelectOptions extends StatefulWidget {
  @override
  State<SelectOptions> createState() => _SelectOptionsState();
}

class _SelectOptionsState extends State<SelectOptions> {
  DateTime? _dateTime;
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2040))
        .then((value) {
      setState(() {
        _dateTime = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: OptionFields(
                hintText: 'Departure',
                icon: Icon(
                  Icons.location_city,
                  color: Colors.red,
                ),
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: OptionFields(
                hintText: 'Destination',
                icon: Icon(
                  Icons.location_city,
                  color: Colors.red,
                ),
              ))
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                  child: OptionFields(
                hintText: 'Adults',
                icon: Icon(
                  Icons.people,
                  color: Colors.red,
                ),
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16),
                  hintText: _dateTime == null ? 'Date' : _dateTime.toString(),
                  //labelText: _dateTime.toString(),
                  fillColor: Colors.white70,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _showDatePicker();
                    },
                    icon: Icon(Icons.date_range),
                    color: Colors.red,
                  ),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
