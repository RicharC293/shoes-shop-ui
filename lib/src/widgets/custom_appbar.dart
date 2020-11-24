import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;

  const CustomAppBar({Key key, @required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: <Widget>[
              Text(
                this.texto,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Icon(Icons.search, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
