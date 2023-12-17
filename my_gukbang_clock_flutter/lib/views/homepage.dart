import 'package:flutter/material.dart';

import 'package:my_gukbang_clock_flutter/views.dart';
import 'package:my_gukbang_clock_flutter/views/gukbang_time_percent_status_bar_view.dart';

class HomePage extends StatelessWidget {
  final ClockView clockView = ClockView();
  final GukbangAnalogClockView gukbangAnalogClockView = GukbangAnalogClockView();
  final GukbangClockView gukbangClockView = GukbangClockView();
  final GukbangTimePercentStatusBarView gukbangTimePercentStatusBarView = GukbangTimePercentStatusBarView();
  final GukbangTimePercentStringView gukbangTimePercentStringView = GukbangTimePercentStringView();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '양시준의 국방시계',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 16),
            Text(
              '공군 병 847기',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '입대: 2023.04.24 / 전역: 2025.01.23',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            clockView,
            const SizedBox(height: 16),
            gukbangAnalogClockView,
            gukbangClockView,
            const SizedBox(height: 16),
            gukbangTimePercentStatusBarView,
            gukbangTimePercentStringView,
          ],
        ),
      ),
    );
  }
}