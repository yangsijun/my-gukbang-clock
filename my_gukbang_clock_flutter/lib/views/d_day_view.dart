import 'package:flutter/material.dart';
import 'package:my_gukbang_clock_flutter/viewmodels.dart';

class DDayView extends StatefulWidget {
  final DDayViewModel viewModel = DDayViewModel.instance;

  DDayView({Key? key}) : super(key: key);
  
  @override
  State<DDayView> createState() => _DDayViewState();
}

class _DDayViewState extends State<DDayView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.viewModel.dDayString,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}