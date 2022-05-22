import 'package:flutter/material.dart';
import 'package:tourism_app/widgets/common/common_header.dart';
import 'package:tourism_app/widgets/list_agencies_vertical.dart';

class AgencyScreen extends StatelessWidget {
  const AgencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(children: [
        CommonHeader(title: 'Agencies'),
        Expanded(child: ListAgenciesVertical())
      ]),
    );
  }
}
