import 'package:flutter/material.dart';
import 'package:my_gukbang_clock_flutter/viewmodels.dart';

class GukbangTimePercentStatusBarView extends StatefulWidget {
  final GukbangClockViewModel viewModel = GukbangClockViewModel.instance;

  GukbangTimePercentStatusBarView({Key? key}) : super(key: key);

  @override
  State<GukbangTimePercentStatusBarView> createState() => _GukbangTimePercentStatusBarViewState();
}

class _GukbangTimePercentStatusBarViewState extends State<GukbangTimePercentStatusBarView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: widget.viewModel.gukbangTimePercentDouble,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: 400,
            height: 10,
            child: CustomPaint(
              painter: GukbangTimePercentStatusBarPainter(
                percent: snapshot.data!,
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

class GukbangTimePercentStatusBarPainter extends CustomPainter {
  final double percent;

  GukbangTimePercentStatusBarPainter({required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    final left = Offset(0, size.height / 2);
    final right = Offset(size.width, size.height / 2);
    final percentOffset = Offset(size.width * percent, size.height / 2);

    final fillBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawLine(left, right, fillBrush);

    final percentFillBrush = Paint()
      ..color = const Color(0xFF444974)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawLine(left, percentOffset, percentFillBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}