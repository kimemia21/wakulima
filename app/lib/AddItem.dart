// import 'package:app/contant.dart';
// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Additem extends StatefulWidget {
//   const Additem({super.key});

//   @override
//   State<Additem> createState() => _AdditemState();
// }

// class _AdditemState extends State<Additem> {
//   final List<String> items = [
//     'Gold',
//     'Coal',
//     'Milk',
//     'Tea',
//   ];
//   List<List<String>> qualities = [
//     ["shiny", "precious", "valuable"], // Qualities of gold
//     ["aromatic", "refreshing", "calming"], // Qualities of tea
//     ["black", "combustible", "energy source"], // Qualities of coal
//     ["nutritious", "white", "versatile"], // Qualities of milk
//   ];

//   String? selectedValue;
//   String? quality;

//   List<String> qualityReturns({required  ItemsList}) {
//     return ItemsList.map((String item) => DropdownMenuItem<String>(
//           value: item,
//           child: Text(
//             item,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//             overflow: TextOverflow.ellipsis,
//           ),
//         )).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Map<String, List<String>> itemsToQualities = {
//       "Gold": qualities[0],
//       "Coal": qualities[1],
//       "Milk": qualities[2],
//       "Tea": qualities[3],
//     };
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             alignment: Alignment.center,
//             margin: EdgeInsets.all(10),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton2<String>(
//                 isExpanded: true,
//                 hint: const Row(
//                   children: [
//                     Icon(
//                       Icons.list,
//                       size: 16,
//                       color: Colors.yellow,
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Expanded(
//                       child: Text(
//                         'Select Category',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.yellow,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//                 items: items
//                     .map((String item) => DropdownMenuItem<String>(
//                           value: item,
//                           child: Text(
//                             item,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ))
//                     .toList(),
//                 value: selectedValue,
//                 onChanged: (String? value) {
//                   setState(() {
//                     selectedValue = value;
//                   });
//                 },
//                 buttonStyleData: ButtonStyleData(
//                   height: 50,
//                   width: 160,
//                   padding: const EdgeInsets.only(left: 14, right: 14),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(14),
//                     border: Border.all(
//                       color: Colors.black26,
//                     ),
//                     color: Colors.redAccent,
//                   ),
//                   elevation: 2,
//                 ),
//                 iconStyleData: const IconStyleData(
//                   icon: Icon(
//                     Icons.arrow_forward_ios_outlined,
//                   ),
//                   iconSize: 14,
//                   iconEnabledColor: Colors.yellow,
//                   iconDisabledColor: Colors.grey,
//                 ),
//                 dropdownStyleData: DropdownStyleData(
//                   maxHeight: 200,
//                   width: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(14),
//                     color: Colors.redAccent,
//                   ),
//                   offset: const Offset(-20, 0),
//                   scrollbarTheme: ScrollbarThemeData(
//                     radius: const Radius.circular(40),
//                     thickness: MaterialStateProperty.all<double>(6),
//                     thumbVisibility: MaterialStateProperty.all<bool>(true),
//                   ),
//                 ),
//                 menuItemStyleData: const MenuItemStyleData(
//                   height: 40,
//                   padding: EdgeInsets.only(left: 14, right: 14),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             alignment: Alignment.center,
//             margin: EdgeInsets.all(10),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton2<String>(
//                 isExpanded: true,
//                 hint: const Row(
//                   children: [
//                     Icon(
//                       Icons.list,
//                       size: 16,
//                       color: Colors.yellow,
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Expanded(
//                       child: Text(
//                         'Select Quality',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.yellow,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//                 items: qualityReturns(
//                     ItemsList: itemsToQualities[selectedValue ?? "Gold"] ??
//                         qualities[0]),
//                 value: selectedValue,
//                 onChanged: (String? value) {
//                   setState(() {
//                     selectedValue = value;
//                   });
//                 },
//                 buttonStyleData: ButtonStyleData(
//                   height: 50,
//                   width: 160,
//                   padding: const EdgeInsets.only(left: 14, right: 14),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(14),
//                     border: Border.all(
//                       color: Colors.black26,
//                     ),
//                     color: Colors.redAccent,
//                   ),
//                   elevation: 2,
//                 ),
//                 iconStyleData: const IconStyleData(
//                   icon: Icon(
//                     Icons.arrow_forward_ios_outlined,
//                   ),
//                   iconSize: 14,
//                   iconEnabledColor: Colors.yellow,
//                   iconDisabledColor: Colors.grey,
//                 ),
//                 dropdownStyleData: DropdownStyleData(
//                   maxHeight: 200,
//                   width: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(14),
//                     color: Colors.redAccent,
//                   ),
//                   offset: const Offset(-20, 0),
//                   scrollbarTheme: ScrollbarThemeData(
//                     radius: const Radius.circular(40),
//                     thickness: MaterialStateProperty.all<double>(6),
//                     thumbVisibility: MaterialStateProperty.all<bool>(true),
//                   ),
//                 ),
//                 menuItemStyleData: const MenuItemStyleData(
//                   height: 40,
//                   padding: EdgeInsets.only(left: 14, right: 14),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
