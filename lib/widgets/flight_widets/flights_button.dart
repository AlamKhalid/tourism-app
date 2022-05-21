import 'package:flutter/material.dart';
import 'package:tourism_app/pages/ticket_page.dart';

import '../../misc/colors.dart';

class FlightsButton extends StatelessWidget {
  final String label;
  const FlightsButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Ticketpage();
              }),
            );
            return;
          },
          child: Text(label),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColors.headingColor1),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )))),
    );
  }
}
