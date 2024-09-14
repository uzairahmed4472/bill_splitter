import 'package:flutter/material.dart';

class SiderBox extends StatefulWidget {
  const SiderBox({
    super.key,
    required this.totalFriends,
    required this.updateFriends,
  });

  final int totalFriends;
  final Function updateFriends;

  @override
  State<SiderBox> createState() => _SiderBoxState();
}

class _SiderBoxState extends State<SiderBox> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      thumbColor: Colors.amber,
      activeColor: Colors.amber,
      inactiveColor: Colors.grey,
      min: 2,
      max: 9,
      value: widget.totalFriends.ceilToDouble(),
      onChanged: (newValue) {
        widget.updateFriends(newValue);
      },
    );
  }
}
