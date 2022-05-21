import 'package:flutter/material.dart';

class OptionFields extends StatefulWidget {
  final String hintText;
  final Icon icon;

  OptionFields({Key? key, required this.hintText, required this.icon})
      : super(key: key);

  @override
  State<OptionFields> createState() => _OptionFieldsState();
}

class _OptionFieldsState extends State<OptionFields> {
  String? dropDownValue;
  List<String> cityList = [
    'Ajman',
    'Al Ain',
    'Dubai',
    'Fujairah',
    'Ras Al Khaimah',
    'Sharjah',
    'Umm Al Quwain'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16),
        fillColor: Colors.white70,
      ),
      icon: widget.icon,
      value: dropDownValue,
      hint: Text(widget.hintText),
      onChanged: (String? val) {
        setState(() {
          dropDownValue = val;
        });
      },
      items: cityList
          .map((cityTitle) =>
              DropdownMenuItem(value: cityTitle, child: Text(cityTitle)))
          .toList(),
    );
  }
}
