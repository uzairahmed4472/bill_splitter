import 'package:bill_splitter/constants.dart';
import 'package:bill_splitter/pages/result_page.dart';
import 'package:bill_splitter/widgets/info_container.dart';
import 'package:bill_splitter/widgets/keypad.dart';
import 'package:bill_splitter/widgets/page_header.dart';
import 'package:bill_splitter/widgets/slider_box.dart';
import 'package:bill_splitter/widgets/tax_box.dart';
import 'package:bill_splitter/widgets/top_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int totalFriends = 2;
  int totalTip = 0;
  int totalTax = 0;

  List totalBill = [""];

  void changeBill() {
    setState(() {
      totalBill;
    });
  }

  String get totatlBil =>
      totalBill.isEmpty || totalBill.length == 1 && totalBill[0] == ""
          ? 0.toString()
          : totalBill.join();
  void updateFriends(double newValue) {
    setState(() {
      totalFriends = newValue.round();
    });
  }

  void onIncrement() {
    setState(() {
      totalTip++;
    });
  }

  void onDecrement() {
    setState(() {
      totalTip--;
    });
  }

  updateTax(value) {
    setState(() {
      if (value.isEmpty) {
        totalTax = 0;
      } else {
        totalTax = int.parse(value);
      }
    });
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                PageHeader(
                  header: 'Split Bill',
                ),
                SizedBox(
                  height: 10,
                ),
                InfoContainer(
                    info: "Total",
                    totalBill: totatlBil,
                    totalFriends: totalFriends,
                    totalTax: totalTax,
                    totalTip: totalTip),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      "How many friends ?",
                      style: ktextStyle1,
                    ),
                    SiderBox(
                      totalFriends: totalFriends,
                      updateFriends: updateFriends,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: TipBox(
                        totalTip: totalTip,
                        onDecrement: onDecrement,
                        onIncrement: onIncrement,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: TaxBox(
                        updateTax: updateTax,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Keypad(
                  totalBill: totalBill,
                  changeBill: changeBill,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 10,
                  // width: double.infinity,
                  color: Colors.green,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResultPage(
                              totalFriends: totalFriends,
                              totalTip: totalTip,
                              totalTax: totalTax,
                              totalBill: totalBill,
                            );
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
      ),
    );
  }
}
