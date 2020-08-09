import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unixbankingclone/get_started.dart';
import 'custom_icons.dart';
import 'BankACPage.dart';
import 'CreditCardPage.dart';
import 'CategoricalLimitsPage.dart';
import 'AboutPage.dart';
import 'SimulatedAPIPage.dart';
import 'package:intl/intl.dart';

Map<String, List> daysMap = {'Mon': [1, 'M'], 'Tue': [2, 'T'], 'Wed': [3, 'W'], 'Thu': [4, 'T'], 'Fri': [5, 'F'], 'Sat': [6, 'S']};

AppBar limitsAppBar({text, context}) {
  return AppBar(
    leading: IconButton(icon: Icon(Icons.keyboard_arrow_left, color: kHeadingTextColor, size: 50,), onPressed: () => Navigator.pop(context),),
    backgroundColor: kBackgroundColor,
    elevation: 0,
    title: Text(
      text,
      style: kGenericDisplayStyle(
          color: kHeadingTextColor, size: 20, weight: FontWeight.w600),
    ),
  );
}


Color activatedButtonColor = kHeadingTextColor;
Color deactivatedButtonColor = Colors.grey;

final kHeadingTextColor = Color.fromARGB(255, 30, 30, 40);
final kSubHeadingTextColor = Color.fromARGB(255, 150, 150, 150);
final kBackgroundColor = Colors.white;
final kBorderColor = Colors.white;

final kTemporaryHeadingTextStyle = TextStyle(
  fontFamily: 'Rubik',
  fontSize: 24.0,
  color: kHeadingTextColor,
);

final kTemporaryItemTextStyle = TextStyle(
  fontFamily: 'Rubik',
  fontSize: 20.0,
  color: kSubHeadingTextColor,
);

TextStyle kGenericDisplayStyle({color, size, weight = FontWeight.w300, height = 1.0}) {
  return TextStyle(
    fontSize: size.toDouble(),
    color: color,
    fontFamily: 'Rubik',
    fontWeight: weight,
    height: height
  );
}


AppBar appbar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: kBackgroundColor,
    leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(CustomIcons.square),
        color: kHeadingTextColor,
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
    title: Text('UNIX', style: TextStyle(color: kHeadingTextColor, fontSize: 20, letterSpacing: 10, fontWeight: FontWeight.w700)),
    actions: <Widget>[
      IconButton(
        icon: Icon(CustomIcons.profile),
        color: kHeadingTextColor,
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => AboutPage(),
          ),
        ),
      )
    ],
  );
}

Container tile({context, title, pageToOpen, trailingIcon = Icons.keyboard_arrow_right, leadingIcon}) {
  return Container(
    color: kBackgroundColor,
    child: ListTile(
      leading: leadingIcon != null ? Icon(
        leadingIcon,
        color: kHeadingTextColor,
      ) : Text(' '),
      trailing : trailingIcon != null ? Icon(
        trailingIcon,
            color: kHeadingTextColor,
      ) : null,
      title: Text(
        title,
        style: kGenericDisplayStyle(color: kHeadingTextColor, size: 20),
      ),
      onTap: () => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => pageToOpen)),
    ),
  );
}

Theme drawer(context) {
  return Theme(
    data: ThemeData().copyWith(canvasColor: kBackgroundColor),
    child: Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 70,
            color: kBackgroundColor,
            child: DrawerHeader(
              child: Text(
                'Menu',
                style: kGenericDisplayStyle(color: kHeadingTextColor, size: 40),
              ),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                backgroundBlendMode: BlendMode.clear,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: tile(
                context: context, title: 'Bank Account', pageToOpen: BankACPage(),
            leadingIcon: Icons.account_balance),
            color: kBackgroundColor,
          ),
          Container(
            child: tile(
                context: context,
                title: 'Credit Card',
                pageToOpen: CreditCardPage(),
            leadingIcon: Icons.credit_card),
            color: kBackgroundColor,
          ),
          Container(
            child: tile(
                context: context,
                title: 'Categorical Limits',
                pageToOpen: CategoricalLimitsPage(),
            leadingIcon: Icons.tune),
            color: kBackgroundColor,
          ),
          Container(
            child: tile(
              context: context,
              title: 'Profile',
              pageToOpen: AboutPage(),
              leadingIcon: CustomIcons.profile,
              trailingIcon: Icons.keyboard_arrow_right,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: tile(
                context: context, title: 'Simulate', pageToOpen: HomeSimulatedPage(),
                leadingIcon: Icons.equalizer),
            color: kBackgroundColor,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: tile(
              context: context,
              title: 'Sign Out',
              pageToOpen: GetStartedPage(),
              leadingIcon: Icons.close,
              trailingIcon: null,
            ),
          )
        ],
      ),
    ),
  );
}

List<Widget> formattedOutputForStack({startX, startY, name, amount, date}) {
  startX = startX.toDouble();
  startY = startY.toDouble();
  return [
    Positioned(
      left: startX,
      top: startY,
      child: Text(name,
        style: kGenericDisplayStyle(
            color: activatedButtonColor, size: 18, weight: FontWeight.w600),
      ),),
    Positioned(
      right: startX,
      top: startY,
      child: Text(
        '${NumberFormat.currency(symbol: '').format(double.parse(amount))} \$',
        style: kGenericDisplayStyle(
            color: activatedButtonColor, size: 18, weight: FontWeight.w600),
      ),),
    Positioned(
      left: startX,
      top: startY + 20,
      child: Text(
        date,
        style: kGenericDisplayStyle(color: deactivatedButtonColor, size: 16),
      ),
    ),
  ];
}