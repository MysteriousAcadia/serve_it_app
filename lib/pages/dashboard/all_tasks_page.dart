import 'package:flutter/material.dart';
import 'package:serveit/components/allTasksCard.dart';

class AllTasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 100,
        ),
        child: Column(
          children: <Widget>[
            AllTasksCard(),
            AllTasksCard(),
          ],
        ),
      ),
    );
  }
}
