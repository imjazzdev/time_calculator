import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:shimmer/shimmer.dart';
import 'package:time_calculator/pages/home.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/start.jpg'),
                    fit: BoxFit.cover)),
          ),
          GlassmorphicContainer(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 50),
            width: MediaQuery.of(context).size.height * 0.8,
            height: MediaQuery.of(context).size.height * 0.30,
            alignment: Alignment.center,
            borderRadius: 17,
            border: 2,
            blur: 5,
            borderGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                  Color.fromARGB(255, 189, 189, 189).withOpacity(0.1),
                ]),
            linearGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 189, 189, 189).withOpacity(0.3),
                  Color.fromARGB(255, 189, 189, 189).withOpacity(0.1),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Count your forward or\nbackward times ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      shadows: [
                        Shadow(
                            blurRadius: 7,
                            color: Colors.purpleAccent.withOpacity(0.9))
                      ]),
                ),
                Text('hopefully useful', style: TextStyle(fontSize: 16)),
                InkWell(
                  onTap: () {
                    Get.to(HomePage());
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.purpleAccent,
                        highlightColor: Colors.purple.shade50,
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: 120,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 12,
                                    color: Colors.purpleAccent.withOpacity(0.8))
                              ],
                              border: Border.all(
                                  width: 0.3, color: Colors.grey.shade50),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.purple.withOpacity(0.7),
                                    Color.fromARGB(255, 228, 228, 228)
                                        .withOpacity(0.1),
                                  ]),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Text(
                        'Started',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
