import 'package:flutter/material.dart';
import 'package:tourism_app/models/flights_ticket.dart';
import 'package:tourism_app/widgets/common/common_header.dart';
import 'package:intl/intl.dart';

import '../models/flight.dart';
import '../services/flightService.dart';
import '../utilities/themeColors.dart';
import '../widgets/flight_widets/ticket_card.dart';

class Ticketpage extends StatefulWidget {
  String? to, from, adults;
  DateTime? date;
  Ticketpage({this.to, this.from, this.date, this.adults});
  @override
  _TicketpageState createState() => _TicketpageState();
}

class _TicketpageState extends State<Ticketpage> {
  late Future<List<Flight>> flights;

  void initState() {
    super.initState();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    flights = fetchFlights(
        widget.to, widget.from, widget.adults, formatter.format(widget.date!));
  }

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('EEE d MMM.');
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                CommonHeader(title: 'Searched Flights', back: true),
                SizedBox(height: 10.0),
                // FlightTickets()
                FutureBuilder<List<Flight>>(
                  future: flights,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Flight> flights = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: double.maxFinite,
                          height: 570,
                          child: ListView.builder(
                              padding: const EdgeInsets.only(top: 5),
                              shrinkWrap: true,
                              itemCount: flights.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TicketCard(
                                  code: flights[index].flightCode,
                                  price: flights[index].price,
                                  originCode: widget.from!,
                                  destinationCode: widget.to!,
                                  date:
                                      formatter.format(widget.date!).toString(),
                                  departureTime: flights[index].departureTime,
                                  arrivalTime: flights[index].arrivalTime,
                                  totalTime: flights[index].duration,
                                );
                              }),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
