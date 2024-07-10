import 'dart:ui';

import 'package:app/Arrivals.dart';
import 'package:app/Deals.dart';
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
      "name": "Gold",
      "imageUrl": "https://www.goodreturns.in/img/2023/03/gold1-1678254479.jpg",
      "onPress": MaterialPageRoute(builder: (context) => TopBar()),
    },
    {
      "name": "Tea",
      "imageUrl":
          "https://media.licdn.com/dms/image/C4E12AQE4P4p2RWx7Xw/article-inline_image-shrink_1000_1488/0/1520170688195?e=1724889600&v=beta&t=nelnt86XuXm3PS-CgLBzkKlTnhdOEI8XUNAUFtWmbp8",
      "onPress": MaterialPageRoute(builder: (context) => TopBar()),
    },
    {
      "name": "Milk",
      "imageUrl":
          "https://5.imimg.com/data5/SELLER/Default/2021/8/AL/BB/PW/4477221/s-s-milk-cans-locking-type-40-ltr--500x500.jpg",
      "onPress": MaterialPageRoute(builder: (context) => TopBar()),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            width: AppWidth(context, 1),
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(2),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200,
                  ),
                  width: AppWidth(context, 1),
                  height: 50,
                  child: InkWell(
                    splashColor: Colors.grey,
                    radius: 100,
                    onTap: () {
                      // Define your onTap action here
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.search_rounded),
                          SizedBox(width: 10),
                          Text("Search on Cxt"),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "CTX Categories",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: AppWidth(context, 1),
                  height: AppHeight(context, 0.3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: GridView.builder(
                    // physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns
                      crossAxisSpacing: 2.0, // Spacing between columns
                      mainAxisSpacing: 2.0, // Spacing between rows
                    ),
                    itemCount: Categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey[500],
                              backgroundImage: NetworkImage(
                                Categories[index]["imageUrl"],
                              ),
                            ),
                            Text(
                              Categories[index]["name"],
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20), // Add some space between the sections
                Arrivals(),
                SizedBox(height: 20), // Add some space between the sections
                Deals(),
              ],
            ),
          ),
        ),
      ),
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
