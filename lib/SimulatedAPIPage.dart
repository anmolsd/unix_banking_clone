import 'package:loading_animations/loading_animations.dart';
import 'package:unixbankingclone/custom_icons.dart';

import 'constants.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

final foodJoints = [
  'McDonalds',
  'KFC',
  'Burger King',
  'Starbucks',
  'Subway',
  'Taco Bell',
  'Pizza Hut',
  'Dunkin\''
];
final miscellaneous = ['Apple Store', 'Samsung Store', 'LG Store'];

final locations = [
  'San Francisco, California, USA',
  'Boston, Massachusetts, USA',
  'Los Angeles, California, USA'
];

class HomeSimulatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      drawer: drawer(context),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                dynamic loc = await getGeocodingAPIResult('Food');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return GeoMap(
                      purpose: 'Food',
                      centerX: loc[0].latitude,
                      centerY: loc[0].longitude,
                      string: loc[1],
                    );
                  }),
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: kHeadingTextColor, width: 3),
                    borderRadius: BorderRadius.circular(5.0)),
                child: ListTile(
                  leading: Icon(
                    CustomIcons.food,
                    size: 50,
                    color: kHeadingTextColor,
                  ),
                  title: Text(
                    '   Food',
                    style: kTemporaryHeadingTextStyle,
                  ),
                  trailing: Icon(Icons.arrow_forward,
                      color: kHeadingTextColor, size: 30),
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () async {
                dynamic loc = await getGeocodingAPIResult('Entertainment');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return GeoMap(
                      purpose: 'Entertainment',
                      centerX: loc[0].latitude,
                      centerY: loc[0].longitude,
                      string: loc[1],
                    );
                  }),
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: kHeadingTextColor, width: 3),
                    borderRadius: BorderRadius.circular(5.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.live_tv,
                    size: 50,
                    color: kHeadingTextColor,
                  ),
                  title: Text(
                    'Entertainment',
                    style: kTemporaryHeadingTextStyle,
                  ),
                  trailing: Icon(Icons.arrow_forward,
                      color: kHeadingTextColor, size: 30),
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () async {
                dynamic loc = await getGeocodingAPIResult('Misc');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return GeoMap(
                      purpose: 'Miscellaneous',
                      centerX: loc[0].latitude,
                      centerY: loc[0].longitude,
                      string: loc[1],
                    );
                  }),
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: kHeadingTextColor, width: 3),
                    borderRadius: BorderRadius.circular(5.0)),
                child: ListTile(
                  leading: Icon(Icons.power, size: 50, color: kHeadingTextColor),
                  title: Text(
                    ' Miscellaneous',
                    style: kTemporaryHeadingTextStyle,
                  ),
                  trailing: Icon(Icons.arrow_forward,
                      color: kHeadingTextColor, size: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GeoMap extends StatefulWidget {
  GeoMap({this.centerX, this.centerY, this.string, this.purpose});

  final double centerX;
  final String purpose;
  final double centerY;
  final String string;

  @override
  _GeoMapState createState() => _GeoMapState();
}

class _GeoMapState extends State<GeoMap> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.showMarkerInfoWindow(MarkerId('0'));
  }

  var amt = (Random().nextInt(134) + 15.99);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      drawer: drawer(context),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.centerX, widget.centerY), zoom: 15.0),
        onMapCreated: _onMapCreated,
        markers: [
          Marker(
            markerId: MarkerId('0'),
            position: LatLng(widget.centerX, widget.centerY),
            infoWindow: InfoWindow(
                title: widget.string.split(',')[0],
                snippet: widget.string
                    .split(',')
                    .sublist(1, widget.string.split(',').length)
                    .reduce((value, element) => value + ', ' + element)),
          )
        ].toSet(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: FloatingActionButton.extended(
            elevation: 20,
            backgroundColor: kHeadingTextColor,
            label: Text('Confirm ' + NumberFormat.currency(symbol: '\$').format(amt)),
            icon: Icon(Icons.check_box),
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => EndingSimulationPage(
                        amount: amt,
                        seStr: widget.string,
                        p: widget.purpose)))),
      ),
    );
  }
}

class EndingSimulationPage extends StatefulWidget {
  EndingSimulationPage({this.amount, this.seStr, this.p});

  final double amount;
  final String seStr;
  final String p;

  @override
  _EndingSimulationPageState createState() => _EndingSimulationPageState();
}

class _EndingSimulationPageState extends State<EndingSimulationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      drawer: drawer(context),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: putData(
                amount: widget.amount,
                searchString: widget.seStr,
                purpose: widget.p),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == true) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        'Success! \nYou just paid \$${NumberFormat.currency(symbol: '').format(widget.amount)} for ${widget.p} at ${widget.seStr}',
                        style: TextStyle(
                            color: kHeadingTextColor, fontSize: 30,
                        fontFamily: 'Rubik',
                        height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  return Text(
                    'Failure!',
                    style:
                        kGenericDisplayStyle(color: Colors.redAccent, size: 40),
                  );
                }
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return LoadingBouncingGrid.square(
                  borderColor: kHeadingTextColor,
                  borderSize: 3,
                  size: 50,
                  backgroundColor: kHeadingTextColor,
                  duration: Duration(milliseconds: 1500),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

Future<bool> putData(
    {double amount, String searchString, String purpose}) async {
  final db = await getDatabase(filter: "None2");
  final int id = db.length + 11;
  final String location = searchString
      .split(',')
      .sublist(1, searchString.split(',').length)
      .reduce((value, element) => value + ', ' + element);
  print('loc:' + location);
  final String vendor = searchString.split(',')[0];
  print('vendor:' + vendor);
  final response = await http.get(
      'https://unix-api-app.herokuapp.com/post?id=' +
          id.toString() +
          '&amount=' +
          amount.toString() +
          '&vendor=' +
          vendor.toString() +
          '&location=' +
          location.toString() +
          '&purpose=' +
          purpose.toString());

  print(response.body);

  if (response.statusCode == 200 && !response.body.contains('Invalid')) {
    return true;
  } else {
    return false;
  }
}

Future getDatabase({filter: "None"}) async {
  final response = await http.get('https://unix-api-app.herokuapp.com/get');

  var db;

  if (response.statusCode == 200) {
    db = HistoryDatabase.fromJson(json.decode(response.body));
    var l = db.transactionMap.values.toList();
    l.sort((Transaction a, Transaction b) => a.dt.compareTo(b.dt));
    if (filter == "None") {
      return db;
    } else if (filter == "None2") {
      return l;
    } else {
      List<Transaction> ans = [];
      for (var i in l) {
        if (i.purpose == filter) {
          ans.add(i);
        }
      }
      l = ans;
    }
    return l;
  }
}

class Transaction {
  Transaction(
      {this.id,
      this.purpose,
      this.location,
      this.amount,
      this.dt,
      this.vendor});

  final int id;
  final String purpose;
  final String location;
  final double amount;
  final DateTime dt;
  final String vendor;
}

class HistoryDatabase {
  HistoryDatabase({this.transactionMap});

  final Map<String, Transaction> transactionMap;

  factory HistoryDatabase.fromJson(Map<String, dynamic> json) {
    Map<String, Transaction> transactions = {};

    for (var i in json.keys) {
      final result = json[i];

      transactions[i] = Transaction(
        id: result['ID'],
        purpose: result['Purpose'],
        location: result['Location'],
        amount: result['Amount'],
        vendor: result['Vendor'],
        dt: DateTime.parse(result['Date']),
      );
    }

    return HistoryDatabase(transactionMap: transactions);
  }
}

FutureBuilder getNMostRecentTransactions({n: -1, filter: "None", startY: 45}) {
  return FutureBuilder(
    future: getDatabase(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        HistoryDatabase db = snapshot.data;
        var l = db.transactionMap.values.toList();
        l.sort((Transaction a, Transaction b) => a.dt.compareTo(b.dt));
        if (filter == "None") {
          l = l.sublist(
              (l.length - n < 0 || n == -1) ? 0 : l.length - n, l.length);
        } else {
          List<Transaction> ans = [];
          for (var i in l.reversed) {
            if (i.purpose == filter) {
              ans.add(i);
            }
          }
          l = ans;
        }
        return Align(
          alignment: Alignment.bottomLeft,
          child: getStackForList(l, startY: startY),
        );
      } else if (snapshot.hasError) {
        return Text(snapshot.error);
      } else {
        return Center(
          child: Container(
              height: 30, width: 30, child: CircularProgressIndicator()),
        );
      }
    },
  );
}

Stack getStackForList(List<Transaction> l, {startY: 45}) {
  List<List<Widget>> result = [];
  List<Widget> finalList = [];
  for (var i in l) {
    result.add(formattedOutputForStack(
        startX: 25.0,
        startY: startY,
        name: i.vendor,
        amount: i.amount.toString(),
        date: DateFormat.yMMMEd().format(i.dt).toString()));
    startY += 60;
  }
  finalList = result.expand((element) => element).toList();
  return Stack(
    children: finalList,
  );
}

Future<double> getTotalSpent(double base,
    {filter: "None2", choice: 'None'}) async {
  var l = await getDatabase(filter: filter);
  var total = base;
  for (var k in l) {
    if (choice == "None") {
      total += k.amount;
    } else if (choice == 'Bank') {
      if (k.amount > 100) {
        total += k.amount;
      }
    } else {
      if (k.amount <= 100) {
        total += k.amount;
      }
    }
  }
  print('Total: ' + total.toString());
  return total;
}

Future<dynamic> getGeocodingAPIResult(String application) async {
  var searchString;
  if (application == "Entertainment") {
    searchString = 'Theatre, ' + locations[Random().nextInt(locations.length)];
    ;
  } else if (application == 'Food') {
    searchString = foodJoints[Random().nextInt(foodJoints.length)] +
        ', ' +
        locations[Random().nextInt(locations.length)];
  } else {
    searchString = miscellaneous[Random().nextInt(miscellaneous.length)] +
        ', ' +
        locations[Random().nextInt(locations.length)];
  }
  print(searchString);
  var result = await http.get(
      'https://us1.locationiq.com/v1/search.php?key=2ac76efd724c97&q=' +
          searchString +
          '&format=json');
  var first = json.decode(result.body);
  var hit = first[Random().nextInt(first.length)];
  return [
    LatLng(double.parse(hit['lat']), double.parse(hit['lon'])),
    searchString
  ];
}
