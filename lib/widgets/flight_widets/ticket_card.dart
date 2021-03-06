import 'package:flutter/material.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/widgets/common/common_header.dart';
import '../../utilities/themeColors.dart';
import '../../utilities/themeStyles.dart';

class TicketCard extends StatefulWidget {
  final String code;
  final double price;
  final String destinationCode;
  final String originCode;
  final String arrivalTime;
  final String departureTime;
  final String totalTime;
  final String date;
  final bool ticketType;
  TicketCard(
      {required this.price,
      this.code = 'Top',
      this.date = 'Fr 6 Mar.',
      required this.arrivalTime,
      required this.departureTime,
      required this.destinationCode,
      required this.originCode,
      required this.totalTime,
      this.ticketType = true});
  @override
  _TicketCardState createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 1),
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, bottom: 30.0, left: 35.0, right: 30),
                  child: Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('${widget.price.toInt()} PKR',
                                style: ThemeStyles.ticketPrice)
                          ],
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(widget.date, style: ThemeStyles.greyStyle),
                            Text(widget.date, style: ThemeStyles.greyStyle),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('${widget.originCode}',
                                style: ThemeStyles.mainBlackTextStyle),
                            Text('${widget.destinationCode}',
                                style: ThemeStyles.mainBlackTextStyle)
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('${widget.departureTime}',
                                style: ThemeStyles.subBlackTextStyle),
                            Text('${widget.arrivalTime}',
                                style: ThemeStyles.subBlackTextStyle),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.blur_on, color: Colors.grey),
                              Text('- - - - - - - - - - - - - '),
                              Icon(Icons.airplane_ticket, color: Colors.grey),
                              Text('- - - - - - - - - - - - - '),
                              Icon(Icons.blur_on, color: Colors.grey),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('${widget.totalTime}',
                                style: ThemeStyles.greyStyle),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.headingColor1,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0)),
                    ),
                    height: 70.0,
                    width: 100.0,
                    child: Center(
                      child: Text(
                        widget.code,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
