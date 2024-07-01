import 'package:app/detail_view.dart';
import 'package:app/model.dart';
import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  List images_farm = [
    "https://kenyaseed.com/wp-content/uploads/2018/02/smaller-farmer.png"
  ];
  @override
  Widget build(BuildContext context) {
    final champions = championsMap.values.toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Center(
                    child: Image.network(
                  "https://kenyaseed.com/wp-content/uploads/2018/02/smaller-farmer.png",
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  titles: champions.map((e) => e.name.toUpperCase()).toList(),
                  images: champions
                      .map((e) => Hero(
                            tag: e.name.toUpperCase(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                e.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                  onPageChanged: (page) {},
                  onSelectedItem: (index) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailView(
                                champion: champions[index],
                              )),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
