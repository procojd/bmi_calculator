import 'inputpage.dart';
import 'package:flutter/material.dart';
import 'constant.dart';



void main() {
  runApp(BMICALC());
}

class BMICALC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: primarycolor,
        ),
        scaffoldBackgroundColor: primarycolor,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.amberAccent)),

        // primarySwatch: Colors.green,
        // backgroundColor:
      ),
      home: Inputpage(),
    );
  }
}
