import 'dart:math';

import 'package:flutter/material.dart';

import 'circular_slider_paint.dart' show CircularSliderMode;
import 'utils.dart';
import 'dart:ui' as ui;

class SliderPainter extends CustomPainter {
  CircularSliderMode mode;
  double startAngle;
  double endAngle;
  double sweepAngle;
  Color selectionColor;
  Color handlerColor;
  double handlerOutterRadius;
  bool showRoundedCapInSelection;
  bool showHandlerOutter;
  double sliderStrokeWidth;
  double smallStrokeWidth;
  Color endCircleColor;

  late Offset initHandler;
  late Offset endHandler;
  late Offset center;
  late double radius;
  late final List<ui.Image> images;

  SliderPainter(
      {required this.mode,
      required this.startAngle,
      required this.endAngle,
      required this.sweepAngle,
      required this.selectionColor,
      required this.handlerColor,
      required this.handlerOutterRadius,
      required this.showRoundedCapInSelection,
      required this.showHandlerOutter,
      required this.sliderStrokeWidth,
      required this.smallStrokeWidth,
      required this.endCircleColor,
      required this.images});

  @override
  void paint(Canvas canvas, Size size) async {
    Paint progress = _getPaint(color: selectionColor);

    center = Offset(size.width / 2, size.height / 2);
    radius = min(size.width / 2, size.height / 2) - sliderStrokeWidth;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -pi / 2 + startAngle, sweepAngle, false, progress);

    Paint handler = _getPaint(color: handlerColor, style: PaintingStyle.fill);
    Paint handlerEnd =
        _getPaint(color: endCircleColor, style: PaintingStyle.fill);

    Paint handlerOutter = _getPaint(
      color: Colors.white,
      width: 8.0,
      style: PaintingStyle.fill,
    );

    // draw handlers
    if (mode == CircularSliderMode.doubleHandler) {
      initHandler = radiansToCoordinates(center, -pi / 2 + startAngle, radius);
      canvas.drawCircle(initHandler, handlerOutterRadius, handlerOutter);
      canvas.drawCircle(initHandler, smallStrokeWidth, handler);
      canvas.drawImageNine(
        images.first,
        Rect.zero,
        Rect.fromCircle(center: initHandler, radius: smallStrokeWidth / 1.55),
        new Paint(),
      );
    }

    endHandler = radiansToCoordinates(center, -pi / 2 + endAngle, radius);

    if (showHandlerOutter) {
      canvas.drawCircle(endHandler, handlerOutterRadius, handlerOutter);
    }
    canvas.drawCircle(endHandler, smallStrokeWidth, handlerEnd);

    canvas.drawImageNine(
      images.last,
      Rect.zero,
      Rect.fromCircle(center: endHandler, radius: smallStrokeWidth / 1.55),
      new Paint(),
    );
    // for (var i = 0; i < 10; i++) {
    //   canvas.drawLine(
    //       Offset(endHandler.dx - 5 * i, endHandler.dy - 5 * i),
    //       Offset(endHandler.dx * i, endHandler.dy * i),
    //       _getPaint(color: Colors.red, width: 1));
    // }
    // double sunRadius = min(endHandler.dx, endHandler.dy);

    // double dashInnterRadius = sunRadius - 5;
    // double dashOuterRadius = sunRadius - 5;
    // for (var i = 0; i < 360; i += 45) {
    //   double px1 = endHandler.dx + dashOuterRadius * cos(i * pi / 90);
    //   double py1 = endHandler.dy + dashOuterRadius * sin(i * pi / 90);

    //   double px2 = endHandler.dx + dashInnterRadius * cos(i * pi / 90);
    //   double py2 = endHandler.dy + dashInnterRadius * sin(i * pi / 90);

    //   if (i.isOdd) {
    //     canvas.drawLine(Offset(px1, py1), Offset(px2, py2),
    //         _getPaint(color: Colors.red, width: 1));
    //   }
    // }
  }

  Paint _getPaint(
          {required Color color, double? width, PaintingStyle? style}) =>
      Paint()
        ..color = color
        ..strokeCap =
            showRoundedCapInSelection ? StrokeCap.round : StrokeCap.butt
        ..style = style ?? PaintingStyle.stroke
        ..strokeWidth = width ?? sliderStrokeWidth;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Path getSun() {
  double sunWidth = 30;
  double sunHeight = 30;

  Path path_0 = Path();
  path_0.moveTo(sunWidth * 0.2347653, sunHeight * 0.3010628);
  path_0.cubicTo(
      sunWidth * 0.2438877,
      sunHeight * 0.3102145,
      sunWidth * 0.2559077,
      sunHeight * 0.3147913,
      sunWidth * 0.2678984,
      sunHeight * 0.3147913);
  path_0.cubicTo(
      sunWidth * 0.2798892,
      sunHeight * 0.3147913,
      sunWidth * 0.2918779,
      sunHeight * 0.3102145,
      sunWidth * 0.3010316,
      sunHeight * 0.3010628);
  path_0.cubicTo(
      sunWidth * 0.3193369,
      sunHeight * 0.2827555,
      sunWidth * 0.3193369,
      sunHeight * 0.2531019,
      sunWidth * 0.3010316,
      sunHeight * 0.2347965);
  path_0.lineTo(sunWidth * 0.2126778, sunHeight * 0.1463822);
  path_0.cubicTo(
      sunWidth * 0.1944330,
      sunHeight * 0.1280769,
      sunWidth * 0.1647168,
      sunHeight * 0.1280769,
      sunWidth * 0.1464115,
      sunHeight * 0.1463822);
  path_0.cubicTo(
      sunWidth * 0.1281061,
      sunHeight * 0.1646875,
      sunWidth * 0.1281061,
      sunHeight * 0.1943412,
      sunWidth * 0.1464115,
      sunHeight * 0.2126465);
  path_0.lineTo(sunWidth * 0.2347653, sunHeight * 0.3010628);
  path_0.close();
  path_0.moveTo(sunWidth * 0.4998578, sunHeight * 0.2186878);
  path_0.cubicTo(
      sunWidth * 0.5257294,
      sunHeight * 0.2186878,
      sunWidth * 0.5467195,
      sunHeight * 0.1976977,
      sunWidth * 0.5467195,
      sunHeight * 0.1718261);
  path_0.lineTo(sunWidth * 0.5467195, sunHeight * 0.04686167);
  path_0.cubicTo(sunWidth * 0.5467195, sunHeight * 0.02099012,
      sunWidth * 0.5257294, 0, sunWidth * 0.4998578, 0);
  path_0.cubicTo(sunWidth * 0.4739863, 0, sunWidth * 0.4529962,
      sunHeight * 0.02099012, sunWidth * 0.4529962, sunHeight * 0.04686167);
  path_0.lineTo(sunWidth * 0.4529962, sunHeight * 0.1718261);
  path_0.cubicTo(
      sunWidth * 0.4529962,
      sunHeight * 0.1976977,
      sunWidth * 0.4739863,
      sunHeight * 0.2186878,
      sunWidth * 0.4998578,
      sunHeight * 0.2186878);
  path_0.close();
  path_0.moveTo(sunWidth * 0.2186878, sunHeight * 0.4998578);
  path_0.cubicTo(
      sunWidth * 0.2186878,
      sunHeight * 0.4739863,
      sunWidth * 0.1976977,
      sunHeight * 0.4529962,
      sunWidth * 0.1718261,
      sunHeight * 0.4529962);
  path_0.lineTo(sunWidth * 0.04686167, sunHeight * 0.4529962);
  path_0.cubicTo(sunWidth * 0.02099012, sunHeight * 0.4529962, 0,
      sunHeight * 0.4739863, 0, sunHeight * 0.4998578);
  path_0.cubicTo(0, sunHeight * 0.5257294, sunWidth * 0.02099012,
      sunHeight * 0.5467195, sunWidth * 0.04686167, sunHeight * 0.5467195);
  path_0.lineTo(sunWidth * 0.1718261, sunHeight * 0.5467195);
  path_0.cubicTo(
      sunWidth * 0.1976977,
      sunHeight * 0.5467195,
      sunWidth * 0.2186878,
      sunHeight * 0.5257294,
      sunWidth * 0.2186878,
      sunHeight * 0.4998578);
  path_0.close();
  path_0.moveTo(sunWidth * 0.7318173, sunHeight * 0.3147913);
  path_0.cubicTo(
      sunWidth * 0.7438061,
      sunHeight * 0.3147913,
      sunWidth * 0.7558280,
      sunHeight * 0.3102145,
      sunWidth * 0.7649504,
      sunHeight * 0.3010608);
  path_0.lineTo(sunWidth * 0.8533042, sunHeight * 0.2126465);
  path_0.cubicTo(
      sunWidth * 0.8716095,
      sunHeight * 0.1943412,
      sunWidth * 0.8716095,
      sunHeight * 0.1646875,
      sunWidth * 0.8533042,
      sunHeight * 0.1463822);
  path_0.cubicTo(
      sunWidth * 0.8349989,
      sunHeight * 0.1280769,
      sunWidth * 0.8052827,
      sunHeight * 0.1280769,
      sunWidth * 0.7870379,
      sunHeight * 0.1463822);
  path_0.lineTo(sunWidth * 0.6986841, sunHeight * 0.2347965);
  path_0.cubicTo(
      sunWidth * 0.6803788,
      sunHeight * 0.2531019,
      sunWidth * 0.6803788,
      sunHeight * 0.2827555,
      sunWidth * 0.6986841,
      sunHeight * 0.3010608);
  path_0.cubicTo(
      sunWidth * 0.7078378,
      sunHeight * 0.3102145,
      sunWidth * 0.7198265,
      sunHeight * 0.3147913,
      sunWidth * 0.7318173,
      sunHeight * 0.3147913);
  path_0.close();
  path_0.moveTo(sunWidth * 0.4998578, sunHeight * 0.7810279);
  path_0.cubicTo(
      sunWidth * 0.4739863,
      sunHeight * 0.7810279,
      sunWidth * 0.4529962,
      sunHeight * 0.8020180,
      sunWidth * 0.4529962,
      sunHeight * 0.8278896);
  path_0.lineTo(sunWidth * 0.4529962, sunHeight * 0.9528540);
  path_0.cubicTo(
      sunWidth * 0.4529962,
      sunHeight * 0.9787255,
      sunWidth * 0.4739863,
      sunHeight * 0.9997157,
      sunWidth * 0.4998578,
      sunHeight * 0.9997157);
  path_0.cubicTo(
      sunWidth * 0.5257294,
      sunHeight * 0.9997157,
      sunWidth * 0.5467195,
      sunHeight * 0.9787255,
      sunWidth * 0.5467195,
      sunHeight * 0.9528540);
  path_0.lineTo(sunWidth * 0.5467195, sunHeight * 0.8278896);
  path_0.cubicTo(
      sunWidth * 0.5467195,
      sunHeight * 0.8020180,
      sunWidth * 0.5257294,
      sunHeight * 0.7810279,
      sunWidth * 0.4998578,
      sunHeight * 0.7810279);
  path_0.close();
  path_0.moveTo(sunWidth * 0.2347653, sunHeight * 0.6986528);
  path_0.lineTo(sunWidth * 0.1464115, sunHeight * 0.7870691);
  path_0.cubicTo(
      sunWidth * 0.1281061,
      sunHeight * 0.8053745,
      sunWidth * 0.1281061,
      sunHeight * 0.8350281,
      sunWidth * 0.1464115,
      sunHeight * 0.8533335);
  path_0.cubicTo(
      sunWidth * 0.1555651,
      sunHeight * 0.8624871,
      sunWidth * 0.1675539,
      sunHeight * 0.8670639,
      sunWidth * 0.1795446,
      sunHeight * 0.8670639);
  path_0.cubicTo(
      sunWidth * 0.1915354,
      sunHeight * 0.8670639,
      sunWidth * 0.2035554,
      sunHeight * 0.8624871,
      sunWidth * 0.2126778,
      sunHeight * 0.8533335);
  path_0.lineTo(sunWidth * 0.3010316, sunHeight * 0.7649192);
  path_0.cubicTo(
      sunWidth * 0.3193369,
      sunHeight * 0.7466139,
      sunWidth * 0.3193369,
      sunHeight * 0.7169601,
      sunWidth * 0.3010316,
      sunHeight * 0.6986528);
  path_0.cubicTo(
      sunWidth * 0.2827262,
      sunHeight * 0.6803457,
      sunWidth * 0.2530101,
      sunHeight * 0.6803494,
      sunWidth * 0.2347653,
      sunHeight * 0.6986528);
  path_0.close();
  path_0.moveTo(sunWidth * 0.9528540, sunHeight * 0.4529962);
  path_0.lineTo(sunWidth * 0.8278896, sunHeight * 0.4529962);
  path_0.cubicTo(
      sunWidth * 0.8020180,
      sunHeight * 0.4529962,
      sunWidth * 0.7810279,
      sunHeight * 0.4739863,
      sunWidth * 0.7810279,
      sunHeight * 0.4998578);
  path_0.cubicTo(
      sunWidth * 0.7810279,
      sunHeight * 0.5257294,
      sunWidth * 0.8020180,
      sunHeight * 0.5467195,
      sunWidth * 0.8278896,
      sunHeight * 0.5467195);
  path_0.lineTo(sunWidth * 0.9528540, sunHeight * 0.5467195);
  path_0.cubicTo(
      sunWidth * 0.9787255,
      sunHeight * 0.5467195,
      sunWidth * 0.9997157,
      sunHeight * 0.5257294,
      sunWidth * 0.9997157,
      sunHeight * 0.4998578);
  path_0.cubicTo(
      sunWidth * 0.9997157,
      sunHeight * 0.4739863,
      sunWidth * 0.9787255,
      sunHeight * 0.4529962,
      sunWidth * 0.9528540,
      sunHeight * 0.4529962);
  path_0.close();
  path_0.moveTo(sunWidth * 0.7649504, sunHeight * 0.6986528);
  path_0.cubicTo(
      sunWidth * 0.7467056,
      sunHeight * 0.6803475,
      sunWidth * 0.7169895,
      sunHeight * 0.6803475,
      sunWidth * 0.6986841,
      sunHeight * 0.6986528);
  path_0.cubicTo(
      sunWidth * 0.6803788,
      sunHeight * 0.7169582,
      sunWidth * 0.6803788,
      sunHeight * 0.7466139,
      sunWidth * 0.6986841,
      sunHeight * 0.7649192);
  path_0.lineTo(sunWidth * 0.7870379, sunHeight * 0.8533335);
  path_0.cubicTo(
      sunWidth * 0.7961603,
      sunHeight * 0.8624871,
      sunWidth * 0.8081803,
      sunHeight * 0.8670639,
      sunWidth * 0.8201711,
      sunHeight * 0.8670639);
  path_0.cubicTo(
      sunWidth * 0.8321617,
      sunHeight * 0.8670639,
      sunWidth * 0.8441506,
      sunHeight * 0.8624871,
      sunWidth * 0.8533042,
      sunHeight * 0.8533335);
  path_0.cubicTo(
      sunWidth * 0.8716095,
      sunHeight * 0.8350281,
      sunWidth * 0.8716095,
      sunHeight * 0.8053745,
      sunWidth * 0.8533042,
      sunHeight * 0.7870691);
  path_0.lineTo(sunWidth * 0.7649504, sunHeight * 0.6986528);
  path_0.close();
  path_0.moveTo(sunWidth * 0.4998578, sunHeight * 0.2811700);
  path_0.cubicTo(
      sunWidth * 0.3790816,
      sunHeight * 0.2811700,
      sunWidth * 0.2811700,
      sunHeight * 0.3790778,
      sunWidth * 0.2811700,
      sunHeight * 0.4998578);
  path_0.cubicTo(
      sunWidth * 0.2811700,
      sunHeight * 0.6206341,
      sunWidth * 0.3790816,
      sunHeight * 0.7185456,
      sunWidth * 0.4998578,
      sunHeight * 0.7185456);
  path_0.cubicTo(
      sunWidth * 0.6206340,
      sunHeight * 0.7185456,
      sunWidth * 0.7185456,
      sunHeight * 0.6206341,
      sunWidth * 0.7185456,
      sunHeight * 0.4998578);
  path_0.cubicTo(
      sunWidth * 0.7185456,
      sunHeight * 0.3790778,
      sunWidth * 0.6206341,
      sunHeight * 0.2811700,
      sunWidth * 0.4998578,
      sunHeight * 0.2811700);
  path_0.close();

  return path_0;
}
