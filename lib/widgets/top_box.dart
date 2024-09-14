import 'package:flutter/material.dart';

class TipBox extends StatelessWidget {
  const TipBox({
    super.key,
    required this.totalTip,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int totalTip;
  final Function onIncrement;
  final Function onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 10),
      // height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            'TIP',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    onDecrement();
                  },
                  icon: Icon(
                    Icons.remove,
                  ),
                ),
              ),
              Text(
                '$totalTip',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    onIncrement();
                  },
                  icon: Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
