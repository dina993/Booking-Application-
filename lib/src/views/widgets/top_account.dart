import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/utils/constants.dart';

class TopProfileAccount extends StatelessWidget {
  const TopProfileAccount({
    Key key,
    this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: size.height * 0.06),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.045,
        vertical: size.height * 0.015,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 7,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.black,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dina El-Borno',
                style: TextStyle(
                  color: kPrimaryDarkenColor,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.045,
                ),
              ),
              Text(
                'didibranding@gmail.com',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: size.width * 0.035,
                ),
              ),
            ],
          ),
          // BellWidget(size: size),
        ],
      ),
    );
  }
}
