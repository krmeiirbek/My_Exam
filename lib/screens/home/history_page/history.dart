import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('History'),
      ),
    );
  }
}
