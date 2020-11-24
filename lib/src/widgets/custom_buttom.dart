import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color color;
  const CustomButtom({
    Key key,
    @required this.text,
    this.height = 40.0,
    this.width = 140.0,
    this.color = Colors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: this.color,
      ),
      child: Text('${this.text}', style: TextStyle(color: Colors.white)),
    );
  }
}
