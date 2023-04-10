import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:intl/intl.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:time_calculator/models/switch_func.dart';

import '../utils/var_global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void _showTimePicker() {
  //   return TimePickerSpinner(
  //     is24HourMode: false,
  //     onTimeChange: (time) {
  //       setState(() {
  //         _dateTime = time;
  //       });
  //     },
  //   );
  // showTimePicker(
  //   context: context,
  //   initialTime: TimeOfDay.now(),

  // );
  // }
  // DateTime _dateTime = DateTime.now();
  //TextEditingController hourController = TextEditingController();
  //TextEditingController minuteController = TextEditingController();

  bool _isData = false;

  Widget hourMinute12H() {
    return new TimePickerSpinner(
      isForce2Digits: true,
      normalTextStyle: TextStyle(color: Colors.grey.shade400, fontSize: 30),
      highlightedTextStyle: TextStyle(
          color: Colors.purpleAccent,
          shadows: [
            Shadow(
                color: Color.fromARGB(255, 248, 248, 248),
                blurRadius: 15,
                offset: Offset(1, 2))
          ],
          fontSize: 35,
          fontWeight: FontWeight.bold),
      is24HourMode: true,
      onTimeChange: (time) {
        VarGlobal.dateTime = time;
      },
    );
  }

  @override
  void initState() {
    VarGlobal.hourController.text = '0';
    VarGlobal.minuteController.text = '0';
    // VarGlobal.onStatus = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? addCount =
        DateFormat('HH:mm').format(VarGlobal.dateTime.add(Duration(
      hours: int.parse(VarGlobal.hourController.text),
      minutes: int.parse(VarGlobal.minuteController.text),
    )));
    String? subtractCount =
        DateFormat('HH:mm').format(VarGlobal.dateTime.subtract(Duration(
      hours: int.parse(VarGlobal.hourController.text),
      minutes: int.parse(VarGlobal.minuteController.text),
    )));
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/img/home.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              GlassmorphicContainer(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                blur: 4,
                borderGradient: LinearGradient(colors: [
                  Color.fromARGB(255, 61, 61, 61),
                  Color.fromARGB(255, 61, 61, 61),
                ]),
                linearGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 39, 39, 39).withOpacity(0.5),
                      Color.fromARGB(255, 71, 71, 71).withOpacity(0.7),
                    ]),
                border: 0,
                borderRadius: 0,
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      VarGlobal.dateTime.hour.toString().padLeft(2, '0') +
                          ':' +
                          VarGlobal.dateTime.minute.toString().padLeft(2, '0'),
                      style: TextStyle(fontSize: 80, shadows: [
                        Shadow(
                            color: Colors.pink,
                            blurRadius: 40,
                            offset: Offset(2, 2))
                      ]),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          alignment: Alignment.center,
                          backgroundColor: Color.fromARGB(255, 24, 24, 24),
                          elevation: 35,
                          title: Text(
                            "Choose time",
                            style: TextStyle(
                                color: Colors.grey.shade200,
                                shadows: [
                                  Shadow(
                                      color: Colors.purpleAccent,
                                      blurRadius: 20,
                                      offset: Offset(2, 3))
                                ]),
                          ),
                          content: hourMinute12H(),
                          actions: [
                            InkWell(
                              onTap: () {
                                Get.back();
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 90,
                                child: Text(
                                  'OK',
                                  style: TextStyle(fontSize: 17),
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.1, color: Colors.white70),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 30, color: Colors.purple)
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromARGB(255, 217, 47, 247),
                                          Color.fromARGB(255, 173, 147, 177),
                                        ]),
                                    borderRadius: BorderRadius.circular(17)),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.purple.withOpacity(0.7),
                              blurRadius: 20)
                        ],
                        border:
                            Border.all(width: 0.1, color: Colors.grey.shade50),
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.1, color: Colors.grey.shade50),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.purple.withOpacity(0.9),
                                Colors.purple.withOpacity(0.5)
                              ]),
                          borderRadius: BorderRadius.circular(17)),
                      child: Text(
                        'Pick Time',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SwitchFuncModel(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.purple.withOpacity(0.3),
                                blurRadius: 10)
                          ],
                          border: Border.all(
                              width: 0.2, color: Colors.purple.shade50),
                          borderRadius: BorderRadius.circular(43)),
                      child: GlassmorphicContainer(
                        width: 90,
                        height: 120,
                        padding: EdgeInsets.only(
                            top: 7, left: 7, right: 7, bottom: 7),
                        borderRadius: 40,
                        blur: 5,
                        border: 2,
                        linearGradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.purple.withOpacity(0.1),
                              Colors.purple.withOpacity(0.1)
                            ]),
                        borderGradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 215, 54, 243)
                                  .withOpacity(0.9),
                              Color.fromARGB(255, 215, 54, 243).withOpacity(0.9)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 13, bottom: 0),
                              child: Text(
                                'Hour',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ),
                            Flexible(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                controller: VarGlobal.hourController,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  // setState(() {
                                  //   _isData = true;
                                  // });
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '0',
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.white70)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.purple.withOpacity(0.3),
                                blurRadius: 10)
                          ],
                          border: Border.all(
                              width: 0.2, color: Colors.purple.shade50),
                          borderRadius: BorderRadius.circular(43)),
                      child: GlassmorphicContainer(
                        width: 90,
                        height: 120,
                        padding: EdgeInsets.only(
                            top: 7, left: 7, right: 7, bottom: 7),
                        borderRadius: 40,
                        blur: 5,
                        border: 2,
                        linearGradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.purple.withOpacity(0.1),
                              Colors.purple.withOpacity(0.1)
                            ]),
                        borderGradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 215, 54, 243)
                                  .withOpacity(0.9),
                              Color.fromARGB(255, 215, 54, 243).withOpacity(0.9)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 13, bottom: 0),
                              child: Text(
                                'Minute',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 21),
                              ),
                            ),
                            Flexible(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                controller: VarGlobal.minuteController,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  // setState(() {
                                  //   _isData = true;
                                  // });
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '0',
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.white70)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                    child: SizedBox(
                  height: 30,
                )),
                InkWell(
                  onTap: () {
                    // if (VarGlobal.onStatus = true) {
                    //   setState(() {
                    //     _isData = true;
                    //     SwitchFuncModel.countAddTime(
                    //         int.parse(VarGlobal.hourController.text),
                    //         int.parse(VarGlobal.hourController.text));
                    //   });
                    // } else {
                    //   setState(() {
                    //     _isData = true;
                    //     var subtract = SwitchFuncModel.countSubtractTime(
                    //         int.parse(VarGlobal.hourController.text),
                    //         int.parse(VarGlobal.hourController.text));
                    //   });
                    // }
                    setState(() {
                      _isData = true;
                      print(VarGlobal.onStatus);
                      VarGlobal.onStatus == true
                          ? print(addCount)
                          : print(subtractCount);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.pinkAccent.withOpacity(0.5),
                              blurRadius: 20)
                        ]),
                    child: GlassmorphicContainer(
                      alignment: Alignment.center,
                      height: 50,
                      width: 110,
                      padding:
                          EdgeInsets.only(top: 7, left: 7, right: 7, bottom: 7),
                      borderRadius: 40,
                      blur: 5,
                      border: 2,
                      linearGradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.purple.withOpacity(0.8),
                            Colors.purple.withOpacity(0.3)
                          ]),
                      borderGradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 215, 54, 243).withOpacity(0.9),
                            Color.fromARGB(255, 215, 54, 243).withOpacity(0.9)
                          ]),
                      child: Text(
                        'Count',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 215, 54, 243)
                                .withOpacity(0.4),
                            blurRadius: 25,
                            offset: Offset(0, 5))
                      ],
                      borderRadius: BorderRadius.circular(23),
                      border:
                          Border.all(width: 0.3, color: Colors.grey.shade50)),
                  child: GlassmorphicContainer(
                    height: 70,
                    width: 200,
                    alignment: Alignment.center,
                    borderRadius: 20,
                    blur: 5,
                    border: 2,
                    linearGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 253, 56, 178).withOpacity(0.3),
                          Color.fromARGB(255, 251, 64, 220).withOpacity(0.2)
                        ]),
                    borderGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 215, 54, 243).withOpacity(0.9),
                          Color.fromARGB(255, 215, 54, 243).withOpacity(0.9)
                        ]),
                    child: _isData
                        ? Text(
                            (VarGlobal.onStatus)
                                ? DateFormat('HH:mm')
                                    .format(VarGlobal.dateTime.add(Duration(
                                    hours: int.parse(
                                        VarGlobal.hourController.text),
                                    minutes: int.parse(
                                        VarGlobal.minuteController.text),
                                  )))
                                : SwitchFuncModel.countSubtractTime(
                                    int.parse(VarGlobal.hourController.text),
                                    int.parse(VarGlobal.minuteController.text)),
                            style: TextStyle(
                              fontSize: 38,
                            ),
                          )
                        : Text(
                            '00:00',
                            style: TextStyle(
                              fontSize: 38,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          // Positioned.fill(
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: CurvedNavigationBar(
          //       backgroundColor: Colors.transparent,
          //       color: Color.fromARGB(255, 36, 36, 36),
          //       buttonBackgroundColor: Colors.purple,
          //       height: 55,
          //       items: <Widget>[
          //         Icon(
          //           Icons.settings,
          //           size: 30,
          //           color: Colors.grey.shade50,
          //         ),
          //         Icon(Icons.home_filled, size: 30, color: Colors.grey.shade50),
          //         Icon(Icons.info_outline_rounded,
          //             size: 30, color: Colors.grey.shade50),
          //       ],
          //       onTap: (index) {
          //         if(index == 0){
          //           Get.to
          //         }
          //       },
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
