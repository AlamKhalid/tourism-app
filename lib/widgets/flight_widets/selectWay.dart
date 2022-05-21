import './btnWay.dart';
import 'package:flutter/material.dart';

class SelectWay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Select the way", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              BtnWay(
                label: "ONE WAY",
                iconData: Icons.trending_flat,
                width: 140,
                color: Color(0xFFF00d5d8),
              ),
              BtnWay(
                label: "ROUND TRIP",
                iconData: Icons.swap_horiz,
                color: Color(0xFFF00d5d8),
              ),
            ],
          )
        ],
      ),
    );
  }
}
