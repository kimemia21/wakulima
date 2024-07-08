import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_icons/simple_icons.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        animationDuration: Duration(milliseconds: 200),
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
            FlashyTabBarItem(
            icon: Icon(Icons.grid_view,size:30,),
            title: Text('All',style: GoogleFonts.poppins(),),
            activeColor: Colors.black54,
            inactiveColor: Color.fromARGB(255, 46, 46, 46),
          ),
        
          FlashyTabBarItem(
          
            icon: Icon(Icons.terrain_rounded,size:30,),
            activeColor: Colors.black54,
            inactiveColor: Colors.black,
            title: Text('Mining',style: GoogleFonts.poppins(),),
          ),
          FlashyTabBarItem(
            icon: Icon(CupertinoIcons.leaf_arrow_circlepath,size:30,),
            title: Text('Agriculture',style: GoogleFonts.poppins(),),
            activeColor: Colors.black54,
            inactiveColor: Colors.black,
          ),
         
          // FlashyTabBarItem(
          //   icon: Icon(Icons.settings),
          //   title: Text('한국어'),
          // ),
        ],
      ),
    );
  }
}