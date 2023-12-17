import 'package:flutter/material.dart';
import 'package:my_gukbang_clock_flutter/viewmodels.dart';

class ClockView extends StatefulWidget {
  final ClockViewModel viewModel = ClockViewModel.instance;

  ClockView({Key? key}) : super(key: key);
  
  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.viewModel.dateTime,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}