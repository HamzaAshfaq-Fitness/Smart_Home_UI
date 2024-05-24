import 'package:flutter/material.dart';
import 'package:smart_home_app/util/smart_device_box.dart';

class SmartPhoneScreen extends StatefulWidget {
  const SmartPhoneScreen({super.key});

  @override
  State<SmartPhoneScreen> createState() => _SmartPhoneScreenState();
}

class _SmartPhoneScreenState extends State<SmartPhoneScreen> {
  //List of Devices
  List mySmartDevices=[
    ["Smart Light", "assets/light-bulb.png",true],
    ["Smart AC", "assets/air-conditioner.png",false],
    ["Smart TV", "assets/smart-tv.png",false],
    ["Smart Fan", "assets/fan.png",false],
  ];

  void powerSwitchChanged(bool value,int index){
    setState(() {
      mySmartDevices[index][2]=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical: screenHeight*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                      'assets/menu.png',
                       height: screenHeight*0.06,
                       color: Colors.grey[800],
                  ),
                  Icon(
                      Icons.person,
                    size: screenHeight*0.06,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
             SizedBox(
              height: screenHeight*0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Welcome Home,'
                      ,style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700])
                  ),
                  const Text(
                      'SMART HOME',
                      style: TextStyle(
                          fontSize: 35
                      )),
                ],
              ),
            ),
             SizedBox(
              height: screenHeight*0.02,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
             SizedBox(
              height: screenHeight*0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05),
              child: const Text(
                'Smart Devices',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
              ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                padding: const EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index){
                return SmartDeviceBox(
                smartDeviceName: mySmartDevices[index][0],
                iconPath: mySmartDevices[index][1],
                powerOn: mySmartDevices[index][2],
                onChanged: (value) => powerSwitchChanged(value,index),
              );
                },
            ),
            ),
          ],
        ),
      ),
    );
  }
}
