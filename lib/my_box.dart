import 'package:flutter/material.dart';

const _boxColors = [
  Colors.pink,
  Colors.teal,
  Colors.yellow,
  Colors.blue,
  Colors.green,
  Colors.brown,
  Colors.limeAccent,
  Colors.blueGrey,
];

class MyBox extends StatelessWidget {
  final int index;
  const MyBox({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 228,
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(14),
      child: Align(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 42,
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.amber,
          width: 2,
        ),
        color: _boxColors[index % _boxColors.length],
      ),
    );
  }
}
