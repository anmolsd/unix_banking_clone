import 'package:flutter/material.dart';
import 'constants.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      drawer: drawer(context),
      backgroundColor: kBackgroundColor,
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'The Anonymous Profile of a Unix App User. Face ID will be required for authentication.',
              textAlign: TextAlign.center,
              style: TextStyle(color: kHeadingTextColor, fontSize: 24, height: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}
