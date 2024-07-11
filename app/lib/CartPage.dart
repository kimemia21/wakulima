import 'package:app/AppBloc.dart';
import 'package:app/Homepage.dart';
import 'package:app/Search.dart';
import 'package:app/contant.dart';
import 'package:app/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Globals().switchScreens(
                    context: context, screen: MyHomePage(title: "homepage"));
              },
              icon: Icon(Icons.arrow_back)),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 2),
              width: AppWidth(context, 0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage()));
                    },
                    child: appBarIcons(
                      icon: Icon(CupertinoIcons.search),
                    ),
                  ),
                  appBarIcons(
                    icon: Icon(CupertinoIcons.ellipsis_vertical),
                  ),
                ],
              ),
            )
          ],
          title: Text(
            "Item",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
        ),
        body: Container(
          height: AppHeight(context, 1),
          width: AppWidth(context, 1),
          child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Text(cartItems[index].toString());
              }),
        ));
  }
}
