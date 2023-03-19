import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/values/custom_text_styles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../common/values/values.dart';
import '../controller.dart';

class StandardScreen extends GetView<CourseDetailsController> {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              floating: true,
              actions: [
                InkWell(
                    onTap: (){
                      Get.back(result: false);
                    },
                    child: Icon(Icons.share)),
                SizedBox(width: 20),
                Icon(Icons.shopping_cart_outlined),
                SizedBox(width: 10),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: controller.youtubePlayerController,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(
                        isExpanded: true,
                        colors: const ProgressBarColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.amberAccent,
                        ),
                      ),
                      const PlaybackSpeedButton(),
                      FullScreenButton(),
                    ],
                  ),
                  builder: (context, player) {
                    return player;
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Қазақстан тарихы",
                      style: title2,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Сен қызыққа толы ежелгі тарих әлемінің қойнауында жүргендей әсер алып, алғашқы адамдардың дамуы жөнінде мағлұмат аласың.",
                      style: subtitle2.copyWith(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Авторы: Молдадосова Алтынай',
                      style: subtitle2.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "9999,99 KZT",
                      style: title1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 32, 45, 171),
                        ),
                        child: Center(
                            child: Text(
                          'Сатып алу',
                          style: title3.copyWith(color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Бұл курстан нені үйренесің!',
                  style: title3.copyWith(color: Colors.black),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.verified,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Писать простые программы на Python 3',
                        style: subtitle2.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                childCount: 4,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Оқу үрдісі',
                      style: title3.copyWith(color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '19 тарау * 129 сабақ * 42 cағ 35 мин сабақтың ұзақтылығы',
                      style: bodyText2.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ExampleItem(example: data[index]),
                childCount: data.length,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Example {
  final String title;
  final List<Example> examples;

  Example(this.title, [this.examples = const <Example>[]]);
}

final List<Example> data = [
  Example(
    "Chapter A",
    [
      Example("Section A0"),
      Example("Section A1"),
      Example("Section A2"),
      Example("Section A3"),
    ],
  ),
  Example(
    "Chapter B",
    [
      Example("Section B0"),
      Example("Section B1"),
      Example("Section B2"),
      Example("Section B3"),
    ],
  ),
  Example(
    "Chapter C",
    [
      Example("Section C0"),
      Example("Section C1"),
      Example("Section C2"),
      Example("Section C3"),
    ],
  ),
  Example(
    "Chapter D",
    [
      Example("Section D0"),
      Example("Section D1"),
      Example("Section D2"),
      Example("Section D3"),
    ],
  ),
];

class ExampleItem extends StatelessWidget {
  const ExampleItem({Key? key, required this.example}) : super(key: key);
  final Example example;

  @override
  Widget build(BuildContext context) {
    return _buildTiles(example);
  }

  Widget _buildTiles(Example example) {
    if (example.examples.isEmpty) {
      return ListTile(title: Text(example.title));
    }
    return ExpansionTile(
      key: PageStorageKey<Example>(example),
      title: Text(example.title),
      children: example.examples.map(_buildTiles).toList(),
    );
  }
}
