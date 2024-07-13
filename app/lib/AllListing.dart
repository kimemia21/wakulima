import 'package:app/AppBloc.dart';
import 'package:app/contant.dart';
import 'package:app/detail_view.dart';
import 'package:app/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Alllisting extends StatefulWidget {
  const Alllisting({super.key});

  @override
  State<Alllisting> createState() => _AlllistingState();
}

class _AlllistingState extends State<Alllisting> {
  final Map<String, dynamic> champion = {
    "name": " item name",
    "quality": "grade 1",
    "quantity": "12 bags",
    "price": "1000 per bag",
    "description": "description text",
    "deliveryDate": " 2 days",
    "imageUrl": Agriculture,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppWidth(context, 1),
      // height: AppHeight(context, 1),
      child: GridView.builder(
        shrinkWrap:true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: all.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return _buildGridItem(context, index);
        },
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Globals().raduis),
      ),
      margin: EdgeInsets.only(bottom: 10),
      width: 100,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              print("this is pressed");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailView(
                    champion: champion,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Globals().imagesEdges(
                  context: context,
                  image: Agriculture[2],
                  height: 100.0,
                  width: 100.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  child: Text(
                    "Best Seller",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.blue.shade400,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: AppHeight(context, 0.002),
                    horizontal: AppHeight(context, 0.005),
                  ),
                  child: Text(
                    "Item$index ",
                    style: GoogleFonts.brunoAce(
                      textStyle: TextStyle(
                        fontSize: AppWidth(context, 0.045),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Text(
              " Price \$450",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(3),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    context.read<CurrentUserProvider>().changeCartCount();
                    cartItems.add(champion);
                  },
                  icon: Icon(
                    CupertinoIcons.shopping_cart,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
