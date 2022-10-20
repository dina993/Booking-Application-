import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/data/example_data.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';
import 'package:flutter_booking_app/src/views/ui/detail_screen.dart';
import 'package:flutter_booking_app/src/views/ui/profile_page.dart';
import 'package:flutter_booking_app/src/views/widgets/booking_card.dart';
import 'package:flutter_booking_app/src/views/widgets/button_service_tag.dart';
import 'package:flutter_booking_app/src/views/widgets/inspiration_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusScopeNode _scopeNode = FocusScopeNode();
  final ExampleData _exampleData = ExampleData();
  int _currentIndex = 0;

  static const _LOGO_BOOKING = 'assets/icons/home_screen/bp_logo.svg';
  static const _AVATAR_IMAGE = 'assets/images/profile.jpg';
  static const _SEARCH_ICON = 'assets/icons/home_screen/bp_search_icon.svg';
  static const _MORE_ICON = 'assets/icons/home_screen/bp_more_icon.svg';
  @override
  Widget build(BuildContext context) {
    final _hmeInputTextStyle = Theme.of(context).textTheme.subtitle2;
    List childrenBody = [HomePage(), HomePage(), HomePage(), ProfilePage()];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20, top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: PAD_ONLY_R20,
                  child: Row(
                    children: [
                      SvgPicture.asset(_LOGO_BOOKING,
                          colorBlendMode: BlendMode.multiply,
                          color: kBackgroundColor),
                      Text(
                        "Booking App",
                        style: TextStyle(fontSize: 17),
                      ),
                      Spacer(),
                      GestureDetector(
                        child: CircleAvatar(child: Image.asset(_AVATAR_IMAGE)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                        },
                      )
                    ],
                  ),
                ),

                SIZED_BOX_H20,

                // Search Field
                Container(
                  margin: PAD_ONLY_R20,
                  padding: PAD_SYM_H20,
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: kBackgroundLightColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: kShadowColor,
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ]),
                  child: Row(
                    children: [
                      SvgPicture.asset(_SEARCH_ICON, height: 16),
                      SIZED_BOX_W20,
                      Expanded(
                        child: FocusScope(
                          node: _scopeNode,
                          child: TextField(
                            autofocus: false,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.name,
                            style: _hmeInputTextStyle,
                            expands: true,
                            maxLines: null,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: HME_HINT_SEARCH_TEXT),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Service Tags
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 20, 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _exampleData
                          .getServiceTags()
                          .map((tag) => ButtonServiceTag(
                              name: tag.name,
                              iconUrl: tag.iconUrl,
                              color: tag.color))
                          .toList()),
                ),

                // Nearby Title
                Padding(
                  padding: PAD_ONLY_R20,
                  child: Row(
                    children: [
                      Text(HME_NEARBY_TEXT, style: TextStyle(fontSize: 20)),
                      Spacer(),
                      SvgPicture.asset(_MORE_ICON)
                    ],
                  ),
                ),

                // List Card
                Container(
                    height: 320,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(top: 12, bottom: 30, right: 20),
                      separatorBuilder: (context, index) => SIZED_BOX_W20,
                      itemCount: _exampleData.getHotelData().length,
                      itemBuilder: (_, index) => GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                      _exampleData.getHotelData()[index]))),
                          child:
                              BookingCard(_exampleData.getHotelData()[index])),
                    )),

                // Inspiration Title
                Padding(
                  padding: PAD_ONLY_R20,
                  child: Row(
                    children: [
                      Text(HME_INSPIRATION_TEXT,
                          style: TextStyle(fontSize: 20)),
                      Spacer(),
                      SvgPicture.asset(_MORE_ICON)
                    ],
                  ),
                ),

                // Inspiration
                Padding(
                  padding: PAD_ONLY_R20,
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 12, bottom: 30),
                        separatorBuilder: (context, index) => SIZED_BOX_H24,
                        itemCount: _exampleData.getInspiration().length,
                        itemBuilder: (context, index) => InspirationCard(
                            _exampleData.getInspiration()[index]),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          height: 72,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              backgroundColor: kBackgroundLightColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              onTap: (index) =>
                  setState(() => childrenBody[_currentIndex] = index),
              items: _exampleData
                  .getNavigationIcon()
                  .map((icon) => BottomNavigationBarItem(
                      icon: SvgPicture.asset(icon,
                          color:
                              _exampleData.getNavigationIcon().indexOf(icon) ==
                                      _currentIndex
                                  ? kPrimaryColor
                                  : kUnseletedColor),
                      label: ''))
                  .toList()),
        ),
      ),
    );
  }
}
