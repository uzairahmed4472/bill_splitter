import 'package:bill_splitter/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const BillSplitter(),
  );
}

class BillSplitter extends StatelessWidget {
  const BillSplitter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
