import 'dart:ui';

import 'package:app/Arrivals.dart';
import 'package:app/Popular.dart';
import 'package:app/TobBar.dart';
import 'package:app/contant.dart';
import 'package:app/detail_view.dart';
import 'package:app/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  final List<String> items =
      List<String>.generate(20, (index) => "Item $index");
  List<Map> Categories = [
    {
      "name": "Coal",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Charcoal_8.jpg/1200px-Charcoal_8.jpg",
      "onPress": MaterialPageRoute(builder: (context) => TopBar()),
    },
    {
      "name": "Coal",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Charcoal_8.jpg/1200px-Charcoal_8.jpg",
      "onPress": MaterialPageRoute(builder: (context) => TopBar()),
    },
    {
      "name": "Coal",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Charcoal_8.jpg/1200px-Charcoal_8.jpg",
      "onPress": MaterialPageRoute(builder: (context) => TopBar()),
    },
    {
      "name": "Coal",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Charcoal_8.jpg/1200px-Charcoal_8.jpg",
      "onPress": MaterialPageRoute(builder: (context) => TopBar()),
    }
  ];

  @override
  Widget build(BuildContext context) {
    // final champions = championsMap.values.toList();
//  Column(
    //   children: <Widget>[TopBar(), popular(context), Arrivals()],
    // ),
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(2),
        child: Stack(
          children: [
            Positioned(
                top: 20,
                right: 20,
                left: 20,
                child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20),
                        color: Colors.grey.shade200),
                    width: AppWidth(context, 1),
                    height: 50,
                    child: InkWell(
                      splashColor: Colors.grey,
                      radius: 100,
                      onTap: () {
                        // print("pressed");
                        // Define your onTap action here
                      },
                      borderRadius: BorderRadius.circular(
                          8), // Optional: Add a border radius for a more button-like feel
                      child: Padding(
                        padding: const EdgeInsets.all(
                            8.0), // Optional: Add some padding for better touch target
                        child: Row(
                          children: [
                            Icon(Icons.search_rounded),
                            SizedBox(width: 10),
                            Text("Search on Cxt")
                          ],
                        ),
                      ),
                    ))),
            Positioned(
                top: 100,
                right: 20,
                left: 20,
                child: Container(
                  width: AppWidth(context, 1),
                  height: AppHeight(context, 0.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color: Colors.grey[300]),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns
                      crossAxisSpacing: 4.0, // Spacing between columns
                      mainAxisSpacing: 4.0, // Spacing between rows
                    ),
                    itemCount: Categories.length,
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          scale: 1.0,
                          Categories[index]["imageUrl"])
                      );
                    },
                  ),
                ))
          ],
        ),
      )),
    );
  }
}


      // Container(
            //   width: double.infinity,
            //   height: 70,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 15.0),
            //     child: Center(
            //         child: Image.network(
            //       "https://kenyaseed.com/wp-content/uploads/2018/02/smaller-farmer.png",
            //       fit: BoxFit.cover,
            //     )),
            //   ),
            // ),
            // Expanded(
            //   child: Container(
            //     child: VerticalCardPager(
            //       textStyle: GoogleFonts.poppins(color: Colors.white),
            //       titles: champions.map((e) => e.name.toLowerCase()).toList(),
            //       images: champions
            //           .map((e) => Hero(
            //                 tag: e.name.toUpperCase(),
            //                 child: ClipRRect(
            //                   borderRadius: BorderRadius.circular(20.0),
            //                   child: Image.network(
            //                     e.imageUrl,
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //               ))
            //           .toList(),
            //       onPageChanged: (page) {},
            //       onSelectedItem: (index) {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => DetailView(
            //                     champion: champions[index],
            //                   )),
            //         );
            //       },
            //     ),
            //   ),
            // ),
