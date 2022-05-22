import 'package:flutter/material.dart';

import '../../pages/ticket_page.dart';
import './option_fields.dart';
import 'flights_button.dart';

class SelectOptions extends StatefulWidget {
  @override
  State<SelectOptions> createState() => _SelectOptionsState();
}

class _SelectOptionsState extends State<SelectOptions> {
  var _adultsController = TextEditingController();
  String? from, to;
  GlobalKey<FormState> _form = GlobalKey();
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

  void setFrom(String? val) {
    setState(() {
      from = val;
    });
  }

  void setTo(String? val) {
    setState(() {
      to = val;
    });
  }

  String? dateValidator() {
    if (_dateTime == null) {
      return "Enter a date";
    }
  }

  void submitForm(ctx) {
    if (_form.currentState!.validate()) {
      Navigator.push(
        ctx,
        MaterialPageRoute(builder: (context) {
          return Ticketpage(
              to: to,
              from: from,
              adults: _adultsController.text,
              date: _dateTime);
        }),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('There is some error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20),
      child: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: OptionFields(
                  setFunction: setFrom,
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
                  setFunction: setTo,
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
                    child: TextFormField(
                  controller: _adultsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.people,
                      color: Colors.red,
                    ),
                    hintText: 'Adults',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16),
                    fillColor: Colors.white70,
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextFormField(
                  validator: (_) => dateValidator(),
                  keyboardType: TextInputType.none,
                  onTap: () {
                    _showDatePicker();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16),
                    hintText: _dateTime == null ? 'Date' : _dateTime.toString(),
                    fillColor: Colors.white70,
                    suffixIcon: IconButton(
                      onPressed: () => _showDatePicker(),
                      icon: Icon(Icons.date_range),
                      color: Colors.red,
                    ),
                  ),
                ))
              ],
            ),
            FlightsButton(label: 'Search for Flights', onPress: submitForm)
          ],
        ),
      ),
    );
  }
}
