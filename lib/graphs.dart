import 'dart:math';
import 'package:flutter/material.dart';
import 'package:unixbankingclone/custom_icons.dart';
import 'constants.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

final transitionsSpentGraphCoordinates = [
  [10, 25.46],
  [20, 33.8385],
  [30, 6.16152],
  [40, 14.54],
  [50, 37.4825],
  [60, 68.6546],
];

final incomesList = [
  5000.00,
  6500.83,
  6850.31,
  6563.62,
  7500.00,
  6350.00,
];

final transitionsIncomeGraphCoordinates = [
  [5, 30.8318],
  [17, 71.7766],
  [30, 25.4064],
  [41, 79.1997],
  [54.5, 10.285],
  [69, 148.444]
];
final spentGraphCoordinates = [
  [0, 2.51752],
  [1, 5.23884],
  [2, 7.87678],
  [3, 10.4277],
  [4, 12.8877],
  [5, 15.2524],
  [6, 17.5171],
  [7, 19.6764],
  [8, 21.7245],
  [9, 23.6548],
  [10, 25.46],
  [11, 27.1318],
  [12, 28.6605],
  [13, 30.0351],
  [14, 31.2428],
  [15, 32.2683],
  [16, 33.0933],
  [17, 33.6953],
  [18, 34.0464],
  [19, 34.1103],
  [20, 33.8385],
  [21, 33.1625],
  [22, 31.9783],
  [23, 30.1036],
  [24, 27.0702],
  [25, 20.0],
  [26, 12.9298],
  [27, 9.89636],
  [28, 8.02174],
  [29, 6.83746],
  [30, 6.16152],
  [31, 5.8897],
  [32, 5.95359],
  [33, 6.30466],
  [34, 6.90672],
  [35, 7.7317],
  [36, 8.75718],
  [37, 9.96486],
  [38, 11.3395],
  [39, 12.8682],
  [40, 14.54],
  [41, 16.3452],
  [42, 18.2755],
  [43, 20.3236],
  [44, 22.4829],
  [45, 24.7476],
  [46, 27.1123],
  [47, 29.5723],
  [48, 32.1232],
  [49, 34.7612],
  [50, 37.4825],
  [51, 40.2838],
  [52, 43.1621],
  [53, 46.1145],
  [54, 49.1384],
  [55, 52.2312],
  [56, 55.3907],
  [57, 58.6148],
  [58, 61.9013],
  [59, 65.2485],
  [60, 68.6546],
  [61, 72.1177],
  [62, 75.6365],
  [63, 79.2093],
  [64, 82.8347],
  [65, 86.5115],
  [66, 90.2382],
  [67, 94.0138],
  [68, 97.8369],
  [69, 101.707],
  [70, 105.622],
  [71, 109.581],
  [72, 113.584],
  [73, 117.63],
  [74, 121.717],
  [75, 125.845]
];

final incomeGraphCoordinates = [
  [0, 39.689],
  [1, 35.9388],
  [2, 33.0146],
  [3, 31.1109],
  [5, 30.8318],
  [7, 35.3108],
  [8, 39.0769],
  [9, 43.589],
  [10, 48.5776],
  [11, 53.7391],
  [12, 58.7545],
  [13, 63.308],
  [14, 67.1073],
  [15, 69.9019],
  [17, 71.7766],
  [19, 68.2885],
  [20, 64.6884],
  [21, 60.0931],
  [22, 54.7689],
  [23, 49.0331],
  [24, 43.2346],
  [25, 37.734],
  [26, 32.881],
  [27, 28.9931],
  [28, 26.3352],
  [30, 25.4064],
  [31, 27.2667],
  [32, 30.6071],
  [33, 35.2586],
  [34, 40.9666],
  [35, 47.4051],
  [36, 54.1939],
  [37, 60.9207],
  [38, 67.1651],
  [39, 72.5234],
  [40, 76.634],
  [41, 79.1997],
  [43, 78.9457],
  [44, 76.0095],
  [45, 71.309],
  [46, 65.0645],
  [47, 57.5975],
  [48, 49.3156],
  [49, 40.6919],
  [50, 32.2403],
  [51, 24.4879],
  [52, 17.9457],
  [53, 13.08],
  [54, 10.285],
  [56, 11.9872],
  [57, 16.7249],
  [58, 23.9948],
  [59, 33.5859],
  [60, 45.1616],
  [61, 58.275],
  [62, 72.3891],
  [63, 86.9033],
  [64, 101.183],
  [65, 114.591],
  [66, 126.52],
  [67, 136.424],
  [68, 143.847],
  [69, 148.444],
  [71, 148.444],
  [72, 143.847],
  [73, 136.424],
  [74, 126.52],
  [75, 114.591]
];

class SineCurvePainter extends CustomPainter {
  SineCurvePainter({this.name, this.daysList});

  var daysList;
  final name;

  @override
  void paint(Canvas canvas, Size size) {
    var data = [];
    var pointData = [];
    if (name == 'income') {
      data = incomeGraphCoordinates;
      pointData = transitionsIncomeGraphCoordinates;
    } else {
      data = spentGraphCoordinates;
      pointData = transitionsSpentGraphCoordinates;
    }
    var dataFinal = [];
    for (int j = 1; j < data.length; j += 2) {
      dataFinal.add(data[j]);
    }
    for (var k in dataFinal) {
      canvas.drawCircle(
          Offset(4 * (k[0].toDouble()), (size.height - k[1]) - 50),
          2,
          Paint()..color = kSubHeadingTextColor);
    }
    var focusCoordinate;
    var coordinateIndex = 0;
    for (int t = 0; t < daysList.length; t++) {
      if (daysList[t] == 1) {
        coordinateIndex = t;
        focusCoordinate = [
          4 * (pointData[t][0].toDouble()),
          size.height - pointData[t][1] - 50
        ];
        canvas.drawCircle(Offset(focusCoordinate[0], focusCoordinate[1]), 5,
            Paint()..color = kHeadingTextColor);
        break;
      }
    }
    int comparator(a, b) {
      if (a[1].toDouble() > b[1]) {
        return 1;
      } else if (a[1].toDouble() == b[1]) {
        return 0;
      } else {
        return -1;
      }
    }

    var offset = 0;
    var dataCopy = dataFinal;
    dataCopy.sort((a, b) => comparator(a, b));
    if ((size.height -
            pointData[coordinateIndex][1] -
            (name == 'income' ? 50 : 75)) >
        size.height -
            (dataCopy[0][1] + dataCopy[dataCopy.length - 1][1]) /
                ((name == 'income') ? 1.5 : 0.5)) {
      offset = (name == 'income') ? 30 : 50;
    } else {
      offset = (name == 'income') ? -30 : -50;
    }
    final left = focusCoordinate[0] - 40;
    final right = focusCoordinate[0] + 40;
    final top = focusCoordinate[1] + offset - 15;
    final bottom = focusCoordinate[1] + offset + 15;
    canvas.drawRRect(
        RRect.fromLTRBR(left, top, right, bottom, Radius.circular(10)),
        Paint()..color = kHeadingTextColor);
    TextSpan span = TextSpan(
        text:
            '${NumberFormat.currency(symbol: '\$', decimalDigits: 0).format(((name == 'income' ? 10525 : 8324) + (pointData[coordinateIndex][1] - pointData[4][1]) * 30).round())}',
        style: kGenericDisplayStyle(
            color: kBackgroundColor, size: 14.0, weight: FontWeight.w600));
    TextPainter painter = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: ui.TextDirection.ltr);
    painter.layout();
    painter.paint(canvas, Offset(left + 15, top + 9));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CircularProgress extends CustomPainter {
  CircularProgress({this.category, this.current, this.limit, this.custom = true, this.icon});
  final current;
  final category;
  final limit;
  final icon;
  final custom;
  @override
  void paint(Canvas canvas, Size size) {
    final endAngle = current / limit * 2 * pi;
    final radius = (size.width - 60) / 2;
    for (int i = 0; i <= 360; i += 10) {
      canvas.drawCircle(
          Offset(size.width / 2 + radius * cos(pi * i / 180),
              size.height / 2 + radius * sin(pi * i / 180)),
          3,
          Paint()..color = kSubHeadingTextColor);
    }
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        -pi / 2,
        endAngle,
        false,
        Paint()
          ..color = kHeadingTextColor
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 10);
    TextSpan span0 = TextSpan(
        text: NumberFormat.currency(symbol: '\$').format(current),
        style: kGenericDisplayStyle(
            color: kHeadingTextColor, size: 35, weight: FontWeight.w400));
    TextPainter tp0 =
    TextPainter(text: span0, textDirection: ui.TextDirection.ltr);
    tp0.layout();
    tp0.paint(canvas, Offset(size.width / 2 - size.width / 4.2, size.height / 2));
    TextSpan span1 = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
            fontSize: 50, fontFamily: icon.fontFamily, color: kHeadingTextColor));
    TextPainter tp1 =
    TextPainter(text: span1, textDirection: ui.TextDirection.rtl);
    tp1.layout();
    tp1.paint(canvas, Offset(size.width / 2 - size.width / 12, size.height / 2 - size.height / 4));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SemiCircularProgressBudgetPainter extends CustomPainter {
  SemiCircularProgressBudgetPainter({this.current, this.limit});
  final current;
  final limit;
  @override
  void paint(Canvas canvas, Size size) {
    final endAngle = current / limit * pi;
    final radius = (size.width - 60) / 2;
    for (int i = 0; i <= 180; i += 10) {
      canvas.drawCircle(
          Offset(size.width / 2 - radius * cos(pi * i / 180),
              size.height - radius * sin(pi * i / 180)),
          3,
          Paint()..color = kSubHeadingTextColor);
    }
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height), width: 2 * radius, height: 2 * radius),
        -pi,
        endAngle,
        false,
        Paint()
          ..color = kHeadingTextColor
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 10);
    TextSpan span0 = TextSpan(
        text: NumberFormat.currency(symbol: '\$').format(current),
        style: kGenericDisplayStyle(
            color: kHeadingTextColor, size: 35, weight: FontWeight.w400));
    TextPainter tp0 =
    TextPainter(text: span0, textDirection: ui.TextDirection.ltr);
    tp0.layout();
    tp0.paint(canvas, Offset(size.width / 2 - size.width / 4.2, size.height - size.height / 3));
    TextSpan span1 = TextSpan(
        text: 'Spent',
        style: TextStyle(
            fontSize: 20, fontFamily: 'Rubik', color: Colors.grey));
    TextPainter tp1 =
    TextPainter(text: span1, textDirection: ui.TextDirection.ltr);
    tp1.layout();
    tp1.paint(canvas, Offset(size.width / 2 - size.width / 12, size.height - size.height / 15));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class HorizontalTravelBar extends CustomPainter {
  HorizontalTravelBar({this.current, this.limit, this.icon, this.location});
  final current;
  final limit;
  final icon;
  final location;
  @override
  void paint(Canvas canvas, Size size) {
    for(int i = 0; i <= 24; i++) {
      canvas.drawCircle(Offset((size.width) / 25 * i, size.height - size.height / 5), 2, Paint()..color = kSubHeadingTextColor);
    }
    canvas.drawLine(Offset(0.0, size.height - size.height / 5), Offset(current / limit * (size.width - 60), size.height - size.height / 5), Paint()
      ..color = kHeadingTextColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10);
    TextSpan span0 = TextSpan(text: String.fromCharCode(icon.codePoint), style: TextStyle(color: kHeadingTextColor, fontSize: 50, fontFamily: icon.fontFamily));
    TextSpan span1 = TextSpan(text: 'Trip to $location', style: kGenericDisplayStyle(color: kHeadingTextColor, weight: FontWeight.w600, size: 18));
    TextSpan span2 = TextSpan(text: '${NumberFormat.currency(symbol: '\$', decimalDigits: 0).format(current)}', style: kGenericDisplayStyle(color: kHeadingTextColor, weight: FontWeight.w600, size: 20));
    TextSpan span3 = TextSpan(text: '${NumberFormat.currency(symbol: '\$', decimalDigits: 0).format(limit)}', style: kGenericDisplayStyle(color: kSubHeadingTextColor, weight: FontWeight.w600, size: 20));
    TextPainter tp0 = TextPainter(text: span0, textDirection: ui.TextDirection.rtl);
    TextPainter tp1 = TextPainter(text: span1, textDirection: ui.TextDirection.ltr);
    TextPainter tp2 = TextPainter(text: span2, textDirection: ui.TextDirection.ltr);
    TextPainter tp3 = TextPainter(text: span3, textDirection: ui.TextDirection.ltr);
    tp0.layout();
    tp1.layout();
    tp2.layout();
    tp3.layout();
    tp0.paint(canvas, Offset(size.width / 2 - size.width / 10, size.height / 10));
    tp1.paint(canvas, Offset(size.width / 2 - size.width / 5, size.height / 10 + size.height / 2.5));
    tp2.paint(canvas, Offset(0.0, 4 / 5 * size.height + size.height / 10));
    tp3.paint(canvas, Offset(size.width - size.width / 5, 4 / 5 * size.height + size.height / 10));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class IncomeGraph extends CustomPainter {
  IncomeGraph({this.list});
  final list;
  @override
  void paint(Canvas canvas, Size size) {
    for(int i = 0; i < 6; i++) {
      var top = (incomesList[i] / 7500 * 15);
      for(int j = 0; j < top.toInt() + 1; j++) {
        canvas.drawCircle(Offset((2 * i + 1) / 2 * size.width / 6, size.height - size.height / 15 * j), 2, Paint()..color = kSubHeadingTextColor);
      }
      if(list[i] == 1) {
       canvas.drawLine(Offset((2 * i + 1) / 2 * size.width / 6, size.height), Offset((2 * i + 1) / 2  * size.width / 6, size.height - (size.height * incomesList[i] / 7500)), Paint()
         ..color = kHeadingTextColor
         ..style = PaintingStyle.stroke
         ..strokeCap = StrokeCap.round
         ..strokeWidth = 6);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
