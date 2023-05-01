import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../constants/constants.dart';

class CustomTextSwitch extends StatefulWidget {
  const CustomTextSwitch({
    super.key,
    required this.flag,
    required this.name,
  });

  final bool flag;
  final String? name;

  @override
  State<CustomTextSwitch> createState() => _CustomTextSwitchState();
}

class _CustomTextSwitchState extends State<CustomTextSwitch> {
  bool switch_value = false;

  @override
  void initState() {
    switch_value = widget.flag;
    super.initState();
  }

  void updateValue(bool val) {
    setState(() {
      switch_value = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.name.toString(), style: const TextStyle(fontSize: 16)),
          FlutterSwitch(
            value: switch_value,
            activeColor: primaryColor,
            width: 45,
            inactiveColor: secondaryColor,
            height: 25,
            toggleSize: 20,
            valueFontSize: 8,
            showOnOff: true,
            onToggle: updateValue,
          )
        ],
      ),
    );
  }
}
