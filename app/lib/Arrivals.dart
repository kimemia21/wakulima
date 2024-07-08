
import 'package:app/contant.dart';
import 'package:app/globals.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Arrivals extends StatefulWidget {
  const Arrivals({super.key});

  @override
  State<Arrivals> createState() => _ArrivalsState();
}

class _ArrivalsState extends State<Arrivals> {
  int activeIndex = 0;
  final List imageUrl = [
    "https://www.kickgame.com/cdn/shop/products/DR5415-103.1.png?v=1678364171&width=1024",
    "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw4b815cdf/nk/347/8/5/2/6/9/34785269_a422_4181_bf0f_c692c10d325e.png?sw=520&sh=520&sm=fit",
    "https://www.nike.sa/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw651f0e1f/nk/b73/9/7/c/2/e/b7397c2e_a99a_41a8_b445_de9ded82681a.png",
    "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw2cf9ce95/nk/51d/3/b/e/b/a/51d3beba_ea5c_4ee6_b702_ba54167ac880.png?sw=520&sh=520&sm=fit",
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
                count: shoes.length),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight(context, 0.3),
      width: AppWidth(context, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.all(AppHeight(context, 0.01)),
            child: Text(
              "New Commodities",
              style: GoogleFonts.brunoAce(
                  textStyle: TextStyle(fontSize: AppHeight(context, 0.02))),
            ),
          ),
          Container(
            height: AppHeight(context, 0.2),
            width: AppWidth(context, 1),
            child: CarouselSlider.builder(
                itemCount: shoes.length,
                itemBuilder: (context, index, realindex) {
                  final urlImage = shoes[index];
                  return Container(
                      width: AppWidth(context, 1),
                      child: buildImage(context, urlImage));
                },
                options: CarouselOptions(
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.ease,
                    height: MediaQuery.of(context).size.height * 0.5)),
          ),
          buildIndicator(),
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
            margin: EdgeInsets.only(left:AppWidth(context, 0.02 )),
            padding: EdgeInsets.only(top: AppHeight(context, 0.02)),
            width: AppWidth(context, 0.37),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Best Choice",style: GoogleFonts.brunoAce(textStyle: TextStyle(
                    fontSize: AppWidth(context, 0.04),
                    color: Colors.blue[300],
                    
                    
                   )),),
                ),
                Container(
                  child: Text("Nike Air Jordan 4",style: GoogleFonts.abel(textStyle: TextStyle(
                    fontSize: AppWidth(context, 0.05),
                    color: Colors.black,
                    
                    
                   )),),
                ),
                 Container(
                  child: Text("\$750",style: GoogleFonts.abel(textStyle: TextStyle(
                    fontSize: AppWidth(context, 0.04),
                    color: Colors.black,
                    
                    
                   )),),
                ),
              ],
            ),
          ),
          
         Globals().imagesEdges(context: context, image: urlImage,height: 150.0,width: 200.0)
        ],
      ),
    ),
  );
}