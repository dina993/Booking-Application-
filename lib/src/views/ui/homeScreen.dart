// import 'package:flutter/material.dart';
// import 'package:flutter_booking_app/src/business_logic/data/example_data.dart';
// import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
// import 'package:flutter_booking_app/src/views/ui/home_screen.dart';
// import 'package:flutter_booking_app/src/views/ui/profile_page.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   // final FocusScopeNode _scopeNode = FocusScopeNode();
//   final ExampleData _exampleData = ExampleData();
//   int _currentIndex = 0;
//   List childrenBody = [HomePage(), HomePage(), HomePage(), ProfilePage()];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: childrenBody[_currentIndex],
//       bottomNavigationBar: ClipRRect(
//         borderRadius: BorderRadius.circular(30),
//         child: SizedBox(
//           height: 72,
//           child: BottomNavigationBar(
//               // type: BottomNavigationBarType.shifting,
//               currentIndex: _currentIndex,
//               backgroundColor: kBackgroundLightColor,
//               showSelectedLabels: false,
//               showUnselectedLabels: false,
//               elevation: 0,
//               onTap: (index) => setState(() => _currentIndex = index),
//               items: _exampleData
//                   .getNavigationIcon()
//                   .map((icon) => BottomNavigationBarItem(
//                       icon: SvgPicture.asset(icon,
//                           color:
//                               _exampleData.getNavigationIcon().indexOf(icon) ==
//                                       _currentIndex
//                                   ? kPrimaryColor
//                                   : kUnseletedColor),
//                       label: ''))
//                   .toList()),
//         ),
//       ),
//     );
//   }
// }
