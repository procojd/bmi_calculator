import 'package:flutter/material.dart';
class Reusablecard extends StatelessWidget {
  Reusablecard(this.colour, this.cardchild);
  final Color colour;
  final Widget cardchild;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: cardchild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          // color: Color.fromARGB(255, 38, 40, 54),
          
          borderRadius: BorderRadius.circular(40.0),
        ));
  }
}
