import 'package:flutter/material.dart';
import 'package:my_gukbang_clock_flutter/viewmodels.dart';

class GukbangClockView extends StatefulWidget {
  final GukbangClockViewModel viewModel = GukbangClockViewModel.instance;

  GukbangClockView({Key? key}) : super(key: key);

  @override
  State<GukbangClockView> createState() => _GukbangClockViewState();
}

class _GukbangClockViewState extends State<GukbangClockView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.viewModel.gukbangTimeString,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!.toString(),
            style: Theme.of(context).textTheme.displaySmall,
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}