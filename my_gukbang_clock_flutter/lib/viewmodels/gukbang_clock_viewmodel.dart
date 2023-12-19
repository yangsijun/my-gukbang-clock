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

  Stream<DateTime> get gukbangTimeStream => model.gukbangTimeStream;

  Stream<String> get gukbangTimeString => model.gukbangTimeStream.map(
    (dt) => '${dt.hour.toString().padLeft(2, "0")}시 ${dt.minute.toString().padLeft(2, "0")}분 ${dt.second.toString().padLeft(2, "0")}초'
  );

  double get gukbangTimePercent => model.percent;

  Stream<String> get gukbangTimePercentString => model.gukbangTimeStream.map(
    (dt) => '${(gukbangTimePercent * 100).toStringAsFixed(7)}%'
  );

  Stream<double> get gukbangTimePercentDouble => model.gukbangTimeStream.map(
    (dt) => gukbangTimePercent
  );
}