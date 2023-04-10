import 'package:flutter/cupertino.dart';

class VarGlobal {
  static final TextEditingController hourController = TextEditingController();
  static final TextEditingController minuteController = TextEditingController();
  static late DateTime dateTime = DateTime.now();
  static late bool onStatus = true;
}
