import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_gukbang_clock_flutter/viewmodels.dart';

class GukbangAnalogClockView extends StatefulWidget {
  final GukbangClockViewModel viewModel = GukbangClockViewModel.instance;

  GukbangAnalogClockView({Key? key}) : super(key: key);

  @override
  State<GukbangAnalogClockView> createState() => _GukbangAnalogClockViewState();
}

class _GukbangAnalogClockViewState extends State<GukbangAnalogClockView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: widget.viewModel.gukbangTimeStream,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: 320,
            height: 320,
            child: CustomPaint(
              painter: GukbangAnalogClockPainter(
                dateTime: snapshot.data!,
                percent: widget.viewModel.gukbangTimePercent,
              ),
              child: Container(),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}

class GukbangAnalogClockPainter extends CustomPainter {
  final DateTime dateTime;
  final double percent;

  GukbangAnalogClockPainter({required this.dateTime, required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);

    const radius = 160.0;
    final fillBrush = Paint()..color = const Color(0xFF444974);
    final outlineBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    canvas.drawCircle(center, radius, fillBrush);
    canvas.drawCircle(center, radius, outlineBrush);

    final scaleBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    for (int i = 0; i < 360; i += 30) {
      final x1 = centerX + (radius - 20) * cos(i * pi / 180 - pi / 2);
      final y1 = centerY + (radius - 20) * sin(i * pi / 180 - pi / 2);
      final x2 = centerX + radius * cos(i * pi / 180 - pi / 2);
      final y2 = centerY + radius * sin(i * pi / 180 - pi / 2);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), scaleBrush);
    }

    final hourHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;
    final hourHandX = centerX + 70 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180 - pi / 2);
    final hourHandY = centerY + 70 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180 - pi / 2);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    final minutesHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;
    final minutesHandX = centerX + 100 * cos((dateTime.minute * 6 + dateTime.second * 0.1) * pi / 180 - pi / 2);
    final minutesHandY = centerY + 100 * sin((dateTime.minute * 6 + dateTime.second * 0.1) * pi / 180 - pi / 2);
    canvas.drawLine(center, Offset(minutesHandX, minutesHandY), minutesHandBrush);

    final secondsHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Color.fromARGB(255, 234, 116, 116), Color.fromARGB(255, 255, 49, 49)]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 4;
    final secondsHandX = centerX + 120 * cos(dateTime.second * 6 * pi / 180 - pi / 2);
    final secondsHandY = centerY + 120 * sin(dateTime.second * 6 * pi / 180 - pi / 2);
    final secondsHandX2 = centerX - 20 * cos((dateTime.second + percent) * 6 * pi / 180 - pi / 2);
    final secondsHandY2 = centerY - 20 * sin((dateTime.second + percent) * 6 * pi / 180 - pi / 2);
    canvas.drawLine(Offset(secondsHandX, secondsHandY), Offset(secondsHandX2, secondsHandY2), secondsHandBrush);

    final centerFillBrush = Paint()..color = const Color(0xFFEAECFF);
    canvas.drawCircle(center, 4, centerFillBrush);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}