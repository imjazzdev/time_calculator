import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:time_calculator/utils/var_global.dart';

class SwitchFuncModel extends StatefulWidget {
  const SwitchFuncModel({Key? key}) : super(key: key);
  static String countAddTime(
    int hour,
    int minute,
  ) {
    return DateFormat('HH:mm').format(VarGlobal.dateTime.add(Duration(
      hours: hour,
      minutes: minute,
    )));
  }

  static String countSubtractTime(
    int hour,
    int minute,
  ) {
    return DateFormat('HH:mm').format(VarGlobal.dateTime.subtract(Duration(
      hours: hour,
      minutes: minute,
    )));
  }

  @override
  State<SwitchFuncModel> createState() => _SwitchFuncModelState();
}

class _SwitchFuncModelState extends State<SwitchFuncModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: VarGlobal.onStatus
                    ? Colors.purple.withOpacity(0.7)
                    : Colors.red.withOpacity(0.7),
                blurRadius: 30)
          ],
          border: Border.all(width: 0.2, color: Colors.purple.shade50),
          borderRadius: BorderRadius.circular(25)),
      child: LiteRollingSwitch(
        value: VarGlobal.onStatus,
        width: 150,
        textSize: 17,
        textOnColor: Colors.grey.shade100,
        textOffColor: Colors.grey.shade100,
        textOn: 'Add',
        textOff: 'Subtract',
        colorOn: Colors.purple,
        colorOff: Colors.red,
        iconOn: Icons.add,
        iconOff: Icons.remove,
        animationDuration: const Duration(milliseconds: 300),
        onChanged: (bool state) {
          state ? VarGlobal.onStatus = true : VarGlobal.onStatus = false;
          print(VarGlobal.onStatus);
        },
        onDoubleTap: () {},
        onSwipe: () {},
        onTap: () {},
      ),
    );
  }
}
