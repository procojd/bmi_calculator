import 'package:flutter/material.dart';
import 'constant.dart';
class cardcontent extends StatelessWidget {
  cardcontent(this.icon, this.label);
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 70.0, color: secondary),
        SizedBox(height: 15.0),
        Text(
          label,
          style: textstyle,
          
        )
      ],
    );
  }
}