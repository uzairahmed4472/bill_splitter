

import 'package:flutter/material.dart';

class TaxBox extends StatelessWidget {
  const TaxBox({
    super.key, required this.updateTax,
  });
  final Function updateTax;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      // height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            // gapPadding: 30,
          ),
          label: Text('Tax in %'),
        ),
        onChanged: (value) {
         updateTax(value);
        },
      ),
    );
  }
}
