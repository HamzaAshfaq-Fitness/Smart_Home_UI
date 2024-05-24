import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth*0.03,vertical: screenHeight*0.015),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[800]: Colors.grey[200],
          borderRadius: BorderRadius.circular(24)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight*0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                  iconPath,
                  height: screenHeight*0.09,
                  color: powerOn ? Colors.white : Colors.black,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth*0.06),
                        child: Text(
                          smartDeviceName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                        color: powerOn ? Colors.white : Colors.black,
                        ),
                        ),
                      )
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                        value: powerOn,
                        onChanged: onChanged,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
