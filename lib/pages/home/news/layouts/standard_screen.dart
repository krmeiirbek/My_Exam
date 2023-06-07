import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/values/custom_text_styles.dart';

import '../controller.dart';

class StandardScreen extends GetView<NewsController> {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Жаңалықтар"),
        centerTitle: false,
        elevation: 1,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      'assets/images/solubility.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        """Central banks have moved globally to keep credit flowing after an unsettled period in the US banking sector and the Credit Suisse merger. Six central banks, including the Bank of England, announced they would boost the flow of US dollars through the global financial system. On Sunday the struggling Credit Suisse was taken over by UBS in a Swiss government-backed deal. The US dollar liquidity "swap line" arrangement will run from Monday. In a statement the Bank of England, Bank of Japan, Bank of Canada, the European Central Bank, US Federal Reserve and Swiss National Bank launched the co-ordinated action to "enhance the provision of liquidity". The announcement said it served as an "important backstop to ease strains in global funding markets" and to lessen the impact on the supply of credit to households and businesses. Instead of borrowing on the open market, British banks will be able to go direct to the Bank of England, and it will borrow from the US Federal Reserve.""",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: bodyText1,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: const Text(" 👍260203231 "),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text("26.01.2023"),
                      const Divider(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      'assets/images/mendeleev.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        """Central banks have moved globally to keep credit flowing after an unsettled period in the US banking sector and the Credit Suisse merger. Six central banks, including the Bank of England, announced they would boost the flow of US dollars through the global financial system. On Sunday the struggling Credit Suisse was taken over by UBS in a Swiss government-backed deal. The US dollar liquidity "swap line" arrangement will run from Monday. In a statement the Bank of England, Bank of Japan, Bank of Canada, the European Central Bank, US Federal Reserve and Swiss National Bank launched the co-ordinated action to "enhance the provision of liquidity". The announcement said it served as an "important backstop to ease strains in global funding markets" and to lessen the impact on the supply of credit to households and businesses. Instead of borrowing on the open market, British banks will be able to go direct to the Bank of England, and it will borrow from the US Federal Reserve.""",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: bodyText1,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: const Text(" 👍2001 "),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text("25.01.2023"),
                      const Divider(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
