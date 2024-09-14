import 'package:flutter/material.dart';

class ResusableButton extends StatefulWidget {
  const ResusableButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.colour,
  });
  final Function onTap;
  final String text;
  final Color colour;

  @override
  State<ResusableButton> createState() => _ResusableButtonState();
}

class _ResusableButtonState extends State<ResusableButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 10,
      // width: double.infinity,
      color: widget.colour,
      child: InkWell(
        onTap: () {
          widget.onTap();
        },
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
