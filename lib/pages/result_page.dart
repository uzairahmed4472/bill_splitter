import 'package:bill_splitter/constants.dart';
import 'package:bill_splitter/pages/home_page.dart';
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
  String splitBill() {
    int friends = widget.totalFriends;

    double bill =
        widget.totalBill.length == 1 && widget.totalBill[0] == ""? 0 : double.parse(widget.totalBill.join());
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Result',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
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
                          'Total',
                          style: ktextStyle1.copyWith(fontSize: 20),
                        ),
                        Text(
                          '${splitBill()} \$',
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
                              "${widget.totalFriends}",
                              style: ktextStyle1,
                            ),
                            Text(
                              "${widget.totalTax} %",
                              style: ktextStyle1,
                            ),
                            Text(
                              "${widget.totalTip} \$",
                              style: ktextStyle1,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                color: Colors.green,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      "Split Bill",
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
