import 'package:flutter/material.dart';
import 'package:my_gukbang_clock_flutter/viewmodels.dart';

class GukbangTimePercentStringView extends StatefulWidget {
  final GukbangClockViewModel viewModel = GukbangClockViewModel.instance;

  GukbangTimePercentStringView({Key? key}) : super(key: key);

  @override
  State<GukbangTimePercentStringView> createState() => _GukbangTimePercentStringViewState();
}

class _GukbangTimePercentStringViewState extends State<GukbangTimePercentStringView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.viewModel.gukbangTimePercentString,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!.toString(),
            style: Theme.of(context).textTheme.displayMedium,
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}