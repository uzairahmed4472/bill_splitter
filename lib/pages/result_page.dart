import 'package:bill_splitter/constants.dart';
import 'package:bill_splitter/pages/home_page.dart';
import 'package:bill_splitter/widgets/info_container.dart';
import 'package:bill_splitter/widgets/page_header.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  ResultPage(
      {super.key,
      required this.totalFriends,
      required this.totalTip,
      required this.totalTax,
      required this.totalBill});

  final int totalFriends;
  final int totalTip;
  final int totalTax;
  final List totalBill;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  calculateAgain() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ),
    );
  }

  String splitBill() {
    int friends = widget.totalFriends;

    double bill = widget.totalBill.isEmpty ||
            widget.totalBill.length == 1 && widget.totalBill[0] == ""
        ? 0
        : double.parse(widget.totalBill.join());
    int tax = widget.totalTax;
    int tip = widget.totalTip;

    double splitBill = ((bill) + (bill * tax / 100) + tip) / friends;

    return splitBill.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PageHeader(header: "Equally Divided"),
              SizedBox(
                height: 20,
              ),
              InfoContainer(
                  info: "Equally Divided",
                  totalBill: splitBill(),
                  totalFriends: widget.totalFriends,
                  totalTax: widget.totalTax,
                  totalTip: widget.totalTip),
              SizedBox(
                height: 15,
              ),
              Text("EveryBody should pay \$${splitBill().toString()}",
                  style: ktextStyle1),
              SizedBox(
                height: 20,
              ),
              Container(
                // width: double.infinity,
                padding: EdgeInsets.all(5),
                color: Color(0xffFE6623),
                child: InkWell(
                  onTap: () {
                    calculateAgain();
                  },
                  child: Center(
                    child: Text(
                      "Calculate Again",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
