import 'dart:math';

import 'package:flutter/material.dart';

class TimeTextPainter extends CustomPainter {
  final double activeTimeFontSize;
  final double timeFontSize;
  final Color activeTimeColor;
  final Color timeColor;
  final TextStyle? textStyle;

  TimeTextPainter({
    required this.activeTimeFontSize,
    required this.timeFontSize,
    required this.activeTimeColor,
    required this.timeColor,
    this.textStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double centerXValue = size.width / 2;
    double centerYValue = size.height / 2;
    double radius = min(centerXValue, centerYValue);

    double dashOuterRadius = radius - size.width / 4.8;

    for (var i = 0; i < 360; i += 30) {
      double px1 = centerXValue + dashOuterRadius * cos(i * pi / 180);
      double py1 = centerYValue + dashOuterRadius * sin(i * pi / 180);
      TimePickerData _time = getTime(i.toInt());
      if (_time.showAmPm) {
        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: "${_time.hours}${_time.isAm ? 'AM' : 'PM'}",
            style: textStyle ??
                TextStyle(
                  fontSize: activeTimeFontSize,
                  fontWeight: FontWeight.bold,
                  color: activeTimeColor,
                  fontFamily: "Cairo",
                ),
          ),
          textAlign: TextAlign.justify,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: size.width);
        textPainter.paint(canvas,
            Offset(px1 - dashOuterRadius / 4.7, py1 - dashOuterRadius / 5));
      } else {
        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: _time.hours.toString(),
            style: TextStyle(
              fontSize: timeFontSize,
              fontWeight: FontWeight.normal,
              color: timeColor,
              fontFamily: "Cairo",
            ),
          ),
          textAlign: TextAlign.justify,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: size.width);
        textPainter.paint(canvas,
            Offset(px1 - dashOuterRadius / 17, py1 - dashOuterRadius / 7));
      }
    }
  }

  TimePickerData getTime(int currentDegree) {
    TimePickerData _time = TimePickerData(
      hours: 0,
      minutes: 0,
      isAm: false,
    );

    if (currentDegree == 270) {
      _time.hours = 12;
      _time.isAm = true;
      _time.showAmPm = true;
    } else if (currentDegree == 300) {
      _time.hours = 2;
    } else if (currentDegree == 330) {
      _time.hours = 4;
    } else if (currentDegree == 0) {
      _time.hours = 6;
      _time.isAm = true;
      _time.showAmPm = true;
    } else if (currentDegree == 30) {
      _time.hours = 8;
    } else if (currentDegree == 60) {
      _time.hours = 10;
    } else if (currentDegree == 90) {
      _time.hours = 12;
      _time.isAm = false;
      _time.showAmPm = true;
    } else if (currentDegree == 120) {
      _time.hours = 2;
    } else if (currentDegree == 150) {
      _time.hours = 4;
    } else if (currentDegree == 180) {
      _time.hours = 6;
      _time.isAm = false;
      _time.showAmPm = true;
    } else if (currentDegree == 210) {
      _time.hours = 8;
    } else if (currentDegree == 240) {
      _time.hours = 10;
    } else {
      _time.hours = 0;
    }

    return _time;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class TimePickerData {
  late int hours;
  late int minutes;
  late bool isAm;
  late bool showAmPm;

  TimePickerData({
    required this.hours,
    required this.minutes,
    required this.isAm,
    this.showAmPm = false,
  });

  timeDataPrint() {
    print("Hour: $hours, Minute: $minutes, Am: $isAm");
  }
}
