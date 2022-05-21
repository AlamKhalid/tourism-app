import 'package:flutter/material.dart';
import 'package:tourism_app/models/flights_ticket.dart';
import 'package:tourism_app/widgets/common/common_header.dart';

import '../utilities/themeColors.dart';

class Ticketpage extends StatefulWidget {
  @override
  _TicketpageState createState() => _TicketpageState();
}

class _TicketpageState extends State<Ticketpage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                CommonHeader(title: 'Flights'),
                SizedBox(height: 10.0),
                FlightTickets()
              ],
            ),
          )
        ],
      ),
    );
  }
}
