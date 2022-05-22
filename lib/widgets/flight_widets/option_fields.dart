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
  List<Map<String, String>> cityList = [
    {"name": "Gwadar", "value": "GWD"},
    {"name": "Peshawar", "value": "PES"},
    {"name": "Karachi", "value": "KHI"},
    {"name": "Chitral", "value": "CJL"},
    {"name": "Dalbandin", "value": "DBA"},
    {"name": "Dera Ghazi Khan", "value": "DEA"},
    {"name": "Faisalabad", "value": "LYP"},
    {"name": "Gilgit", "value": "GIL"},
    {"name": "Islamabad", "value": "ISB"},
    {"name": "Lahore", "value": "LHE"},
    {"name": "Moenjodaro", "value": "MJD"},
    {"name": "Multan", "value": "MUX"},
    {"name": "Nawabshah", "value": "WNS"},
    {"name": "Panjgur", "value": "PJG"},
    {"name": "Quetta", "value": "UET"},
    {"name": "Rahim Yar Khan", "value": "RYK"},
    {"name": "Saidu Sharif", "value": "SDT"},
    {"name": "Sialkot", "value": "SKT"},
    {"name": "Skardu", "value": "KDU"},
    {"name": "Sukkur", "value": "SKZ"},
    {"name": "Turbat", "value": "TUK"},
    {"name": "Zhob", "value": "PZH"},
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
          .map((city) => DropdownMenuItem(
              value: city['value'], child: Text(city['name']!)))
          .toList(),
    );
  }
}
