import 'package:bill_splitter/pages/home_page.dart';
import 'package:flutter/material.dart';

class Keypad extends StatefulWidget {
  Keypad({super.key, required this.totalBill, required this.changeBill});

  final  List totalBill;
  final VoidCallback changeBill;

  @override
  State<Keypad> createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
  final List<String> keys = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    '-'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.7,
        crossAxisCount: 3,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
      ),
      itemCount: keys.length,
      itemBuilder: (context, index) {
        return Container(
          // margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                if (keys[index] == keys.last) {
                  widget.totalBill.removeLast();
                  widget.changeBill();
                } else {
                  widget.totalBill.add(keys[index]);
                  widget.changeBill();
                }
              });
            },
            child: Center(
              child: Text(
                keys[index],
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
