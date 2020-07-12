import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'graphs.dart';

class BankACPage extends StatefulWidget {
  @override
  _BankACPageState createState() => _BankACPageState();
}

class _BankACPageState extends State<BankACPage> with SingleTickerProviderStateMixin {

  var graphToShow;
  var day;

  var incomeButtonColor;
  var spentButtonColor;

  var activeList = [0, 0, 0, 0, 1, 0];

  GestureDetector dayButton({day}) {
    return GestureDetector(
      child: Container(
        child: Text(
          daysMap[day][1],
          style: kGenericDisplayStyle(
            weight: FontWeight.w600,
            color: activeList[daysMap[day][0] - 1] == 1 ? activatedButtonColor : deactivatedButtonColor,
            size: 20,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          for(int k = 0; k < activeList.length; k++) {
            if(k == daysMap[day][0] - 1) {
              activeList[k] = 1;
            } else {
              activeList[k] = 0;
            }
          }
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    incomeButtonColor = activatedButtonColor;
    spentButtonColor = deactivatedButtonColor;
    graphToShow = 'income';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: drawer(context),
      appBar: appbar(context),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$12,928.12',
                      style: kGenericDisplayStyle(
                          color: kHeadingTextColor, size: 40, weight: FontWeight.w400, height: 0.0),
                    ),
                    Text('Current Balance',
                      style: kGenericDisplayStyle(
                          color: Colors.grey,
                          weight: FontWeight.w400,
                          size: 20,
                        height: 3.0
                      ),)
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ButtonBar(
                alignment: MainAxisAlignment.start,
                buttonPadding: EdgeInsets.only(left: 5, right: 5),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: FlatButton(
                      child: Text(
                        'Income',
                        style: TextStyle(
                          color: incomeButtonColor,
                          fontFamily: 'Rubik',
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () => setState(() {
                        incomeButtonColor = activatedButtonColor;
                        spentButtonColor = deactivatedButtonColor;
                        graphToShow = 'income';
                      }),
                      color: kBackgroundColor,
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Spent',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 20,
                        color: spentButtonColor
                      ),
                    ),
                    onPressed: () => setState(() {
                      spentButtonColor = activatedButtonColor;
                      incomeButtonColor = deactivatedButtonColor;
                      graphToShow = 'spent';
                    }),
                    color: kBackgroundColor,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 35, right: 30),
                child: Container(
                  child: CustomPaint(
                    painter: SineCurvePainter(name: graphToShow, daysList: activeList),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  dayButton(day: 'Mon'),
                  dayButton(day: 'Tue'),
                  dayButton(day: 'Wed'),
                  dayButton(day: 'Thu'),
                  dayButton(day: 'Fri'),
                  dayButton(day: 'Sat'),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Stack(
                  children: formattedOutputForStack(startX: 25.0, startY: 45.0, name: 'Mixcloud Premium', amount: '5.99', date: '19 Nov 2019')
              ),
            ),
            ),
        ],
        ),
      ),
    );
  }
}
