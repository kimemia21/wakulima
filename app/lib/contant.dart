import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Role { TANKER, FIGHTER, MARKSMAN, MAGE, ASSASIN }

enum Difficulty { LOW, MODERATE, HIGH }

final backgoundColor = Colors.white;
final imageOpacity = Colors.black;
final appbarColor = Color(0xff112120);

final detailsTextColor = Color(0xff112120);

final difficultyEnableColor = Color(0xff08d6f6);
final difficultyDisableColor = Color(0xff023240);

final textTheme = TextTheme(
  titleLarge: TextStyle(
      fontSize: 60.0,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
      fontStyle: FontStyle.italic,
      letterSpacing: 4.0),
  titleMedium: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
      letterSpacing: 1.0),
  titleSmall: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
      letterSpacing: 1.0),
  bodyLarge: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
      letterSpacing: 1.0),
);

AppWidth(context, size) {
  return MediaQuery.of(context).size.width * size;
}

AppHeight(context, size) {
  return MediaQuery.of(context).size.height * size;
}

List all = [
  "https://www.greenlife.co.ke/wp-content/uploads/2022/04/Tea-Picking.jpg",
  "https://borgenproject.org/wp-content/uploads/5367333294_11355b10a6_c.jpg",
  "https://lh3.googleusercontent.com/ePwpK6fEaE3sYD0EZW02s6jICcS-o0nbgSStVHewRSRksEE8-bG_6utTlcbpqvJQlZqVa1eEH_YhvBuQ6UTYEEn80FV-ihlEejj_pk5xLinYAg=s1500",
  "https://i.shgcdn.com/19200e5f-1079-4858-b5df-30b3a9d99ae5/-/format/auto/-/preview/3000x3000/-/quality/lighter/",
  "https://www.heritagefoods.in/blog/wp-content/uploads/2020/12/shutterstock_539045662.jpg",
  "https://imageio.forbes.com/specials-images/imageserve/607c03be4b5b7c7fe822e494/Coal-mining---coal-miner-in-the-man-hands-of-coal-background--Picture-idea-about-coal/0x0.jpg?format=jpg&crop=1657,931,x0,y0,safe&width=960",
];

List Agriculture = [
  "https://www.packtek.in/wp-content/uploads/2023/02/Tea-Packaging-1.jpg",
  "https://pictures-kenya.jijistatic.com/6341508__620x1103.jpg",
  "https://www.teahong.com/wp-content/uploads/2017/08/standard-packings-re4.jpg",
  "https://dcassetcdn.com/design_img/2780703/153037/153037_15261472_2780703_f3a1275b_image.jpg",
];
List mining = [
  "https://www.beaeka.com/wp-content/uploads/2023/07/9P1A6735-768x512.jpg",
  "https://dailynews.co.tz/wp-content/uploads/2024/06/55d4c3cf874886dcf726ba6ea5bfe756.jpeg",
  "https://www.jumbosack.com/wp-content/uploads/2023/08/mining-industry-bulk-bags-with-dirt.webp",
];

List<Map> cartItems = [];
Widget appBarIcons({required Icon icon}) {
  return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: icon);
}

Widget cartItem(
    {required BuildContext context,
    required List image,
    required String name,
    required String price}) {
  print("${[image, name, price]}");

  return Container(
      height: AppHeight(context, .2),
      width: AppWidth(context, 1),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.5, color: Colors.grey.shade500),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              spreadRadius: 2,

              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadiusDirectional.circular(10)),
      margin: EdgeInsets.all(AppWidth(context, 0.05)),
      padding: EdgeInsets.all(4),
      child: Stack(
        children: [
          Positioned(
              top: 10,
              child: Image.network(
                  width: AppWidth(context, .2),
                  height: AppHeight(context, .15),
                  fit: BoxFit.contain,
                 image[0])),
          Positioned(
              top: 14,
              left: AppWidth(context, .25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Kshs $price",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )
                ],
              )),
        ],
      ));
}
