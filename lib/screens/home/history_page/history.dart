import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scrollbar(
            controller: controller,
            thickness: 5,
            thumbVisibility: true,
            radius: Radius.circular(10),
            child: GridView.builder(
              controller: controller,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ),
                itemCount: 100,
                itemBuilder: (_,index){
                  return Text('index $index');
                },
            ),
          ),
        ),
      ),
    );
  }
}
