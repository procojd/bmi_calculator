import 'dart:ffi';
import 'resultpage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'functionality.dart';
import 'constant.dart';
import 'cardcontent.dart';
import 'reusable.dart';

int height = 120;
int weight = 60;
int age = 1;

class Inputpage extends StatefulWidget {
  @override
  State<Inputpage> createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  Color maleCard = inactivecardcolor;
  Color femaleCard = inactivecardcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (() {
                      setState(() {
                        maleCard = cardcolor;
                        femaleCard = inactivecardcolor;
                      });
                    }),
                    child: Reusablecard(
                      maleCard,
                      cardcontent(FontAwesomeIcons.mars, 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: (() {
                    setState(() {
                      maleCard = inactivecardcolor;
                      femaleCard = cardcolor;
                    });
                  }),
                  child: Reusablecard(femaleCard,
                      cardcontent(FontAwesomeIcons.venus, 'FEMALE')),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Reusablecard(
                        cardcolor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('HEIGHT', style: textstyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: boldtext,
                                ),
                                Text(
                                  'cm',
                                  style: textstyle,
                                )
                              ],
                            ),
                            Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              activeColor: Colors.amber,
                              inactiveColor: Colors.white,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              },
                            ),
                          ],
                        ))),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusablecard(
                    cardcolor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: textstyle),
                        Text(weight.toString(), style: boldtext),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Buttonicon(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  if (weight < 200) weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Buttonicon(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  if (weight > 0) weight--;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Reusablecard(
                  cardcolor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE', style: textstyle),
                      Text(age.toString(), style: boldtext),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Buttonicon(
                            icon: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                if (age < 100) age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Buttonicon(
                            icon: FontAwesomeIcons.minus,
                            onpressed: () {
                              setState(() {
                                if (age > 0) age--;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          gesturebutton(page: 1, txt: 'calculate')
        ],
      ),
    );
  }
}

class gesturebutton extends StatelessWidget {
  gesturebutton({required this.page, required this.txt});
  final String txt;
  final int page;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Brain calc = Brain(height: height, weight: weight);
        if (page == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Resultpage(
                result: calc.calculateBMI(),
                resultinstruction: calc.getResult(),
                resulttext:calc.getInstruction() ,
              )));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Inputpage()));
        }
      },
      child: Container(
        child: Center(
            child: Text(
          txt,
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
        )),
        margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(35),
        ),
        height: bottomch,
        width: double.infinity,
      ),
    );
  }
}

class Buttonicon extends StatelessWidget {
  Buttonicon({required this.icon, required this.onpressed});
  final IconData icon;
  final onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child: Icon(icon, color: Colors.white),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: buttoncolor,
    );
  }
}
