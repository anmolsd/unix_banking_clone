import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unixbankingclone/SimulatedAPIPage.dart';
import 'constants.dart';
import 'package:intl/intl.dart';

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
                      FutureBuilder(
                      future: getTotalSpent(15694.26, choice: 'CC'),
                      builder: (context, snapshot) {
                        if(snapshot.hasData) {
                          return Text(
                            NumberFormat.currency(symbol: '\$').format(2 * 15694.26 - snapshot.data),
                            style: kGenericDisplayStyle(
                                color: Colors.white, size: 40, weight: FontWeight.w400, height: 0.0),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Loading Error. Reopen page from drawer.');
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: LinearProgressIndicator(backgroundColor: Colors.white,),
                          );
                        }
                      }
                      ),
                          Text(
                            'Current Balance',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 2.5),
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
            child: getNMostRecentTransactions(n: 4),
          )
        ],
      ),
    );
  }
}
