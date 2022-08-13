import 'package:bmi_calculator/inputpage.dart';
import 'package:bmi_calculator/reusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'constant.dart';

class Resultpage extends StatelessWidget {
  Resultpage(
      {required this.result,
      required this.resulttext,
      required this.resultinstruction});


  final String result;
  final String resulttext;
  final String resultinstruction;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text('Your Result', style: titletextstyle),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
                flex: 5,
                child: Reusablecard(
                    cardcolor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            resultinstruction,
                            style: resulttextstyle,
                          ),
                        ),
                        Text(
                          result,
                          style: bmitextstyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            resulttext,
                            style: instructiontextstyle,
                          ),
                        ),
                      ],
                    ))),
            
            gesturebutton(page: 0, txt: 'RE-CALCULATE'),
          ],
        ),
      ),
    );
  }
}
