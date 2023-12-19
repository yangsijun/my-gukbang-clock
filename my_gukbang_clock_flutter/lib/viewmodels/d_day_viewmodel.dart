import 'package:my_gukbang_clock_flutter/models.dart';

class DDayViewModel {
  static DDayViewModel? _instance;

  static DDayViewModel get instance {
    _instance ??= DDayViewModel(model: DDayModel.instance);
    return _instance!;
  }

  final DDayModel model;

  DDayViewModel({required this.model});

  Stream<String> get dDayString => model.dDayStream.map(
    (dDay) => (dDay == 0) ? '전역' : 'D-$dDay'
  );
}