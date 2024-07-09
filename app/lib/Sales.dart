import 'package:app/Arrivals.dart';
import 'package:app/Popular.dart';
import 'package:app/TobBar.dart';
import 'package:app/detail_view.dart';
import 'package:app/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  
  @override
  Widget build(BuildContext context) {
    
    // final champions = championsMap.values.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[TopBar(), popular(context), Arrivals()],
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
