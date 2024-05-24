import 'package:flutter/material.dart';
import 'package:smart_home_app/smart_screen.dart';
void main(){
  runApp(
     MyApp()
  );
}
class MyApp extends StatelessWidget {
   MyApp({super.key});

   // late double screenHeight;
  @override
  Widget build(BuildContext context) {
     // screenHeight = MediaQuery.of(context).size.height;
     // screenWidth = MediaQuery.of(context).size.width;

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     home: SmartPhoneScreen(),
    );


  }
}

