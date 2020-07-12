import 'package:flutter/material.dart';
import 'BankACPage.dart';
import 'constants.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/fern_light_1.jpeg'),
                  fit: BoxFit.fill),
            ),
          ),
          Center(
            child: Text(
              'UNIX',
              style: TextStyle(
                letterSpacing: 30,
                fontSize: 28,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w700,
                color: kHeadingTextColor,
              ),
            ),
          ),
          Container(
            child: Text(
              'Unix is a Visa\u00ae debit card and mobile \n' +
                  'app that connects your money to \n' +
                  'friends, family, brands \n' +
                  'and experiences',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Rubik',
                height: 1.5,
                color: kSubHeadingTextColor,
                fontSize: 18,
              ),
              maxLines: 4,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 100.0, right: 100, bottom: 35),
              child: FlatButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BankACPage(),
                  ),
                ),
                child: Container(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: kHeadingTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Rubik'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
