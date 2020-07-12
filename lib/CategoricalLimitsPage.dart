import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unixbankingclone/custom_icons.dart';
import 'package:unixbankingclone/graphs.dart';
import 'constants.dart';

class CategoricalLimitsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      drawer: drawer(context),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Basic',
                    style: kGenericDisplayStyle(color: kHeadingTextColor, size: 35),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: kHeadingTextColor,
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.monetization_on,
                        size: 25,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'Income',
                        style: kGenericDisplayStyle(
                            size: 25,
                            weight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Colors.grey,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => IncomePage())),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: kHeadingTextColor,
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.trending_up,
                        size: 25,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'Budget',
                        style: kGenericDisplayStyle(
                            size: 25,
                            weight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Colors.grey,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => BudgetPage())),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Categories',
                    style: kGenericDisplayStyle(color: kHeadingTextColor, size: 35),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: kHeadingTextColor,
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.card_travel,
                        size: 25,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'Travel',
                        style: kGenericDisplayStyle(
                            size: 25,
                            weight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Colors.grey,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => TravelPage())),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: kHeadingTextColor,
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.live_tv,
                        size: 25,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'Entertainment',
                        style: kGenericDisplayStyle(
                            size: 25,
                            weight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Colors.grey,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  EntertainmentPage(current: 1575.44, limit: 2500.00,))),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: kHeadingTextColor,
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.fastfood,
                        size: 25,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'Food',
                        style: kGenericDisplayStyle(
                            size: 25,
                            weight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Colors.grey,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => FoodPage(current: 1233.75, limit: 3000,))),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodPage extends StatelessWidget {
  FoodPage({this.current, this.limit});
  final current;
  final limit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: limitsAppBar(text: 'Food', context: context),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.height / 3,
                  child: CustomPaint(
                    painter: CircularProgress(
                        category: 'Food',
                        current: current,
                        limit: limit,
                        icon: CustomIcons.food),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  formattedOutputForStack(
                      startX: 20,
                      startY: 20,
                      name: 'Burger King',
                      amount: '- 2.99',
                      date: '18 Nov 2019'),
                  formattedOutputForStack(
                      startX: 20,
                      startY: 80,
                      name: 'Pizza Hut',
                      amount: '- 29.99',
                      date: '18 Nov 2019'),
                  formattedOutputForStack(
                      startX: 20,
                      startY: 140,
                      name: 'Taco Bell',
                      amount: '- 15.99',
                      date: '18 Nov 2019'),
                  formattedOutputForStack(
                      startX: 20,
                      startY: 200,
                      name: 'Pizza Hut',
                      amount: '- 16.99',
                      date: '17 Nov 2019'),
                  formattedOutputForStack(
                      startX: 20,
                      startY: 260,
                      name: 'Yo! China',
                      amount: '- 12.99',
                      date: '17 Nov 2019'),
                ].expand((element) => element).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EntertainmentPage extends StatelessWidget {
  EntertainmentPage({this.current, this.limit});
  final current;
  final limit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: limitsAppBar(text: 'Entertainment', context: context),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.height / 3,
                  child: CustomPaint(
                    painter: CircularProgress(
                        category: 'Entertainment',
                        current: current,
                        limit: limit,
                        icon: Icons.tv),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  formattedOutputForStack(
                      startX: 20,
                      startY: 20,
                      name: 'PVR Cinemas',
                      amount: '- 39.99',
                      date: '18 Nov 2019'),
                  formattedOutputForStack(
                      startX: 20,
                      startY: 80,
                      name: 'PVR Cinemas',
                      amount: '- 19.99',
                      date: '11 Nov 2019'),
                  formattedOutputForStack(
                      startX: 20,
                      startY: 140,
                      name: 'Got Talent',
                      amount: '- 49.99',
                      date: '1 Nov 2019'),
                  formattedOutputForStack(
                      startX: 20,
                      startY: 200,
                      name: 'PVR Cinemas',
                      amount: '- 19.99',
                      date: '15 Oct 2019'),
                  formattedOutputForStack(
                      startX: 20,
                      startY: 260,
                      name: 'Hamilton Musical',
                      amount: '- 39.99',
                      date: '1 Oct 2019'),
                ].expand((element) => element).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BudgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: limitsAppBar(text: 'Budget', context: context),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: CustomPaint(
                    painter: SemiCircularProgressBudgetPainter(
                        current: 4101.67, limit: 6000),
                  ),
                ),),
            SizedBox(height: 20,),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      top: 20,
                      child: Text(
                        '\$8,500',
                        style: kGenericDisplayStyle(
                            color: kHeadingTextColor,
                            weight: FontWeight.w400,
                            size: 30),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 60,
                      child: Text(
                        'Monthly Limit',
                        style: kGenericDisplayStyle(
                            color: Colors.grey,
                            weight: FontWeight.w400,
                            size: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    formattedOutputForStack(
                        startX: 20,
                        startY: 20,
                        name: 'Burger King',
                        amount: '- 2.99',
                        date: '18 Nov 2019'),
                    formattedOutputForStack(
                        startX: 20,
                        startY: 80,
                        name: 'Pizza Hut',
                        amount: '- 29.99',
                        date: '18 Nov 2019'),
                    formattedOutputForStack(
                        startX: 20,
                        startY: 140,
                        name: 'Taco Bell',
                        amount: '- 15.99',
                        date: '18 Nov 2019'),
                    formattedOutputForStack(
                        startX: 20,
                        startY: 200,
                        name: 'PVR Cinemas',
                        amount: '- 39.99',
                        date: '18 Nov 2019'),
                    formattedOutputForStack(
                        startX: 20,
                        startY: 260,
                        name: 'Pizza Hut',
                        amount: '- 16.99',
                        date: '17 Nov 2019'),
                  ].expand((element) => element).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TravelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: limitsAppBar(text: 'Travel', context: context),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: CustomPaint(
                  painter: SemiCircularProgressBudgetPainter(
                      current: 2700, limit: 5000),
                ),
              )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: CustomPaint(
                painter: HorizontalTravelBar(
                  current: 1800,
                  limit: 2500,
                  icon: Icons.image,
                  location: 'Shimla',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20),
              child: CustomPaint(
                painter: HorizontalTravelBar(
                  current: 900,
                  limit: 2500,
                  icon: CustomIcons.sandals,
                  location: 'Hawaii',
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class IncomePage extends StatefulWidget {
  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  var activeList = [0, 0, 0, 1, 0, 0];
  var activeIndex = 3;

  GestureDetector dayButton({day}) {
    return GestureDetector(
      child: Container(
        child: Text(
          daysMap[day][1],
          style: kGenericDisplayStyle(
            weight: FontWeight.w600,
            color: activeList[daysMap[day][0] - 1] == 1
                ? activatedButtonColor
                : deactivatedButtonColor,
            size: 20,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          for (int k = 0; k < activeList.length; k++) {
            if (k == daysMap[day][0] - 1) {
              activeList[k] = 1;
              activeIndex = k;
            } else {
              activeList[k] = 0;
            }
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: limitsAppBar(text: 'Income', context: context),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  child: Text(
                    NumberFormat.currency(symbol: '\$')
                        .format(incomesList[activeIndex]),
                    style: kGenericDisplayStyle(
                        color: kHeadingTextColor,
                        size: 35,
                        weight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: CustomPaint(
                  painter: IncomeGraph(
                    list: activeList,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
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
            )
          ],
        ),
      ),
    );
  }
}
