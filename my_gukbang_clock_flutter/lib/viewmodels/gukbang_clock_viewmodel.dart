import 'package:my_gukbang_clock_flutter/models.dart';

class GukbangClockViewModel {
  static GukbangClockViewModel? _instance;
  
  static GukbangClockViewModel get instance {
    _instance ??= GukbangClockViewModel(
        model: GukbangClockModel.instance
      );
    return _instance!;
  }

  final GukbangClockModel model;
  final ClockModel clockModel = ClockModel.instance;

  GukbangClockViewModel({required this.model});

  Stream<DateTime> get gukbangTime => clockModel.dateTimeStream.map(
    (dt) => model.calculateGukbangTime(dt)
  );

  Stream<String> get gukbangTimeString => gukbangTime.map(
    (dt) => '${dt.hour.toString().padLeft(2, "0")}시 ${dt.minute.toString().padLeft(2, "0")}분 ${dt.second.toString().padLeft(2, "0")}초'
  );

  double get gukbangTimePercent => model.percent;

  Stream<String> get gukbangTimePercentString => gukbangTime.map(
    (dt) => '${(gukbangTimePercent * 100).toStringAsFixed(7)}%'
  );

  Stream<double> get gukbangTimePercentDouble => gukbangTime.map(
    (dt) => gukbangTimePercent
  );
}