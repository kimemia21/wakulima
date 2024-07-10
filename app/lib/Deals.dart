import 'package:app/AppBloc.dart';
import 'package:app/contant.dart';
import 'package:app/globals.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Deals extends StatefulWidget {
  const Deals({super.key});

  @override
  State<Deals> createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  int activeIndex = 0;
  final List<Map> testMap = [
    {
      "description":
          " High-quality coal with excellent energy output, ideal for heating and industrial use. Low in impurities for a cleaner burn.",
      "price": "2300",
      "imageUrl":
          "https://www.kickgame.com/cdn/shop/products/DR5415-103.1.png?v=1678364171&width=1024",
    },
    {
      "description":
          " Investment-grade 24K gold bars, perfect for secure investments and wealth preservation. Pure and reliable quality",
      "price": "4000",
      "imageUrl":
          "https://www.kickgame.com/cdn/shop/products/DR5415-103.1.png?v=1678364171&width=1024",
    },
    {
      "description":
          "Refreshing and healthy organic green tea, rich in antioxidants. Perfect for a rejuvenating and calming experience",
      "price": "7800",
      "imageUrl":
          "https://www.kickgame.com/cdn/shop/products/DR5415-103.1.png?v=1678364171&width=1024",
    },
    {
      "description":
          "Pure and fresh dairy milk, rich in nutrients and ideal for daily consumption. Creamy taste with natural goodness.",
      "price": "7800",
      "imageUrl":
          "https://www.kickgame.com/cdn/shop/products/DR5415-103.1.png?v=1678364171&width=1024",
    }
  ];

  Widget buildIndicator() => Container(
        margin:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.025),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSmoothIndicator(
                effect: ExpandingDotsEffect(
                    paintStyle: PaintingStyle.fill,
                    dotWidth: MediaQuery.of(context).size.width * 0.04,
                    dotHeight: MediaQuery.of(context).size.height * 0.0039,
                    activeDotColor: Colors.black),
                activeIndex: activeIndex,
                count: context.watch<CurrentUserProvider>().list.length),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: AppHeight(context, 0.1),
      width: AppWidth(context, 1),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadiusDirectional.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.all(AppHeight(context, 0.01)),
            child: Text(
              "Today's Deals",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  textStyle: TextStyle(fontSize: AppHeight(context, 0.02))),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildImage(
  context,
  String urlImage,
) {
  return Container(
    width: AppWidth(context, 0.8),
    margin: EdgeInsets.symmetric(
        horizontal: AppWidth(context, 0.005),
        vertical: AppWidth(context, 0.005)),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppHeight(context, 0.02))),
    child: Container(
      padding: EdgeInsets.all(AppWidth(context, 0.02)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: AppWidth(context, 0.02)),
            padding: EdgeInsets.only(top: AppHeight(context, 0.02)),
            // width: AppWidth(context, 0.37),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Best Choice",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: AppWidth(context, 0.04),
                      color: Colors.blue[300],
                    )),
                  ),
                ),
                Container(
                  child: Text(
                    "Nike Air Jordan 4",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    )),
                  ),
                ),
                Container(
                  child: Text(
                    "\$750",
                    style: GoogleFonts.abel(
                        textStyle: TextStyle(
                      fontSize: AppWidth(context, 0.04),
                      color: Colors.black,
                    )),
                  ),
                ),
              ],
            ),
          ),
          Globals().imagesEdges(
              context: context, image: urlImage, height: 100.0, width: 120.0)
        ],
      ),
    ),
  );
}
