import 'package:app/contant.dart';
import 'package:app/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget popular(context) {
;
  return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(AppWidth(context, 0.04))),
      margin: EdgeInsets.symmetric(
          
          horizontal: AppWidth(
            context,
            0.02,
          )),
      height: AppHeight(context, 0.371),
      width: AppWidth(context, 1),
      child: ListView.builder(
          itemCount: shoes.length,
          physics: BouncingScrollPhysics(
              parent: ScrollPhysics(),
              decelerationRate: ScrollDecelerationRate.normal),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int Index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Globals().raduis)),
              margin: EdgeInsets.only(
                  left: AppWidth(context, 0.04),
                  right: AppWidth(context, 0.01),
                  top: AppWidth(context, 0.04),
                  bottom: AppWidth(context, 0.04)),
              width: AppWidth(context, 0.45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Globals().imagesEdges(context: context,image:shoes[Index],height: 150.0, width: 150.0 ),
                 
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: AppHeight(context, 0.002),
                        horizontal: AppHeight(context, 0.005)),
                    child: Text(
                      "Best Seller",
                      style: GoogleFonts.brunoAce(
                          textStyle: TextStyle(
                              fontSize: AppWidth(context, 0.04),
                              color: const Color.fromARGB(255, 153, 194, 228))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: AppHeight(context, 0.002),
                        horizontal: AppHeight(context, 0.005)),
                    child: Text(
                      "Nike Air Jordan 4",
                      style: GoogleFonts.brunoAce(
                          textStyle: TextStyle(
                              fontSize: AppWidth(context, 0.045),
                              color: Colors.black)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: AppHeight(context, 0.002),
                        horizontal: AppHeight(context, 0.005)),
                    child: Text(
                      "\$450",
                      style: GoogleFonts.brunoAce(
                          textStyle: TextStyle(
                              fontSize: AppWidth(context, 0.04),
                              color: Colors.black)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: AppHeight(context, 0.06),
                          width: AppWidth(context, 0.12),
                          decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(AppWidth(context, 0.03)),
                                  bottomLeft:
                                      Radius.circular(AppWidth(context, 0.03)),
                                  bottomRight: Radius.circular(
                                      AppWidth(context, 0.03)))),
                          child: Icon(
                            CupertinoIcons.plus,
                            color: Colors.white,
                            size: AppHeight(context, 0.03),
                          )),
                    ],
                  )
                ],
              ),
            );
          }));
}