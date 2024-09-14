import 'package:bill_splitter/constants.dart';
import 'package:bill_splitter/pages/result_page.dart';
import 'package:bill_splitter/widgets/info_container.dart';
import 'package:bill_splitter/widgets/keypad.dart';
import 'package:bill_splitter/widgets/page_header.dart';
import 'package:bill_splitter/widgets/slider_box.dart';
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
                      child: Container(
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
                                      setState(() {
                                        totalTip--;
                                      });
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
                                      setState(() {
                                        totalTip++;
                                      });
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
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
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
                            setState(() {
                              if (value.isEmpty) {
                                totalTax = 0;
                              } else {
                                totalTax = int.parse(value);
                              }
                            });
                          },
                        ),
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
