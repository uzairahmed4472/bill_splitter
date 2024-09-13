
import 'package:bill_splitter/constants.dart';
import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.totalBill,
    required this.totalFriends,
    required this.totalTax,
    required this.totalTip,
    required this.info,
  });

  final String totalBill;
  final int totalFriends;
  final int totalTax;
  final int totalTip;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info,
                style: ktextStyle1.copyWith(fontSize: 20),
              ),
              Text(
                '$totalBill \$',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Friends',
                    style: ktextStyle1,
                  ),
                  Text(
                    'Tax',
                    style: ktextStyle1,
                  ),
                  Text(
                    'Tip',
                    style: ktextStyle1,
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$totalFriends",
                    style: ktextStyle1,
                  ),
                  Text(
                    "$totalTax %",
                    style: ktextStyle1,
                  ),
                  Text(
                    "$totalTip \$",
                    style: ktextStyle1,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
