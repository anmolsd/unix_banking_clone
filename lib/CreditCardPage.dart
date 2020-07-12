import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class CreditCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appbar(context),
      drawer: drawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 30, 30, 40),
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '\u00b7 \u00b7 \u00b7',
                              style: kGenericDisplayStyle(
                                  color: Colors.grey, size: 14),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '\$15,694.26',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 35,),
                          ),
                          Text(
                            'Current Balance',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.5),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '\u00b7 \u00b7 \u00b7 \u00b7',
                            style: kGenericDisplayStyle(
                                color: Colors.grey, size: 14, weight: FontWeight.w600),
                          ),
                          Text(
                            '\u00b7 \u00b7 \u00b7 \u00b7',
                            style: kGenericDisplayStyle(
                                color: Colors.grey, size: 14, weight: FontWeight.w600),
                          ),
                          Text(
                            '\u00b7 \u00b7 \u00b7 \u00b7',
                            style: kGenericDisplayStyle(
                                color: Colors.grey, size: 14, weight: FontWeight.w600),
                          ),
                          Text(
                            '3 4 5 2',
                            style: kGenericDisplayStyle(
                                color: Colors.grey, size: 14, weight: FontWeight.w600),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: FlatButton(
                color: kBackgroundColor,
                child: Text(
                  'Send Money',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 20,
                    color: activatedButtonColor,
                  ),
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 15,
                    backgroundColor: kBackgroundColor,
                    title: Text(
                      'Unix Notification',
                      style: kGenericDisplayStyle(size: 18, color: kHeadingTextColor),
                    ),
                    content: Text('You just sent a gift to Jane Doe', style: kGenericDisplayStyle(color: kSubHeadingTextColor, size: 16),),
                    actions: <Widget>[
                      FlatButton(
                        color: kHeadingTextColor,
                        child: Text('Okay', style: kGenericDisplayStyle(color: kBackgroundColor, size: 16),),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                formattedOutputForStack(startX: 20, startY: 20, name: 'Starbucks Coffee', date: '19 Nov 2019', amount: '- 5.99'),
                formattedOutputForStack(startX: 20, startY: 80, name: 'Walmart', date: '18 Nov 2019', amount: '- 15.99'),
                formattedOutputForStack(startX: 20, startY: 140, name: 'Apple', date: '16 Nov 2019', amount: '- 749.99'),
                formattedOutputForStack(startX: 20, startY: 200, name: 'Marks and Spencer', date: '15 Nov 2019', amount: '- 99.99'),
              ].expand((element) => element).toList(),
            ),
          )
        ],
      ),
    );
  }
}
