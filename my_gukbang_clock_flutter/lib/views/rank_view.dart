import 'package:flutter/material.dart';
import 'package:my_gukbang_clock_flutter/viewmodels.dart';

class RankView extends StatefulWidget {

  RankView({Key? key}) : super(key: key);

  @override
  State<RankView> createState() => _RankViewState();

  final RankViewModel viewModel = RankViewModel.instance;
}

class _RankViewState extends State<RankView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.viewModel.rankString,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            style: Theme.of(context).textTheme.displayMedium,
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}