import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../utils/var_global.dart';

class TestPa extends StatefulWidget {
  const TestPa({Key? key}) : super(key: key);

  @override
  State<TestPa> createState() => _TestPaState();
}

class _TestPaState extends State<TestPa> {
  TextEditingController hourC = TextEditingController();
  TextEditingController minuteC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LiteRollingSwitch(
          onDoubleTap: () {},
          onSwipe: () {},
          value: true,
          onTap: () {
            // VarGlobal.onStatus = !VarGlobal.onStatus;
            // print(VarGlobal.onStatus);
          },
          onChanged: (bool state) {
            state ? VarGlobal.onStatus = true : VarGlobal.onStatus = false;
            print(VarGlobal.onStatus);
            // setState(() {
            //   // VarGlobal.onStatus = true;
            //   print(state);
            // });

            // setState(() {
            //   // VarGlobal.onStatus = false;
            //   print(state);
            // });
          },
        ),
      ),
    );
  }
}
