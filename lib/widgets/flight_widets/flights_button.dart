import 'package:flutter/material.dart';
import 'package:tourism_app/pages/ticket_page.dart';

import '../../misc/colors.dart';

class FlightsButton extends StatelessWidget {
  final String label;
  final Function onPress;
  const FlightsButton({Key? key, required this.label, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
          onPressed: () => onPress(context),
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
