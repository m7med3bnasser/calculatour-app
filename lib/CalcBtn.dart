import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalcBtn extends StatelessWidget {
  String txt;
  Function OnClick;
  CalcBtn(this.txt, this.OnClick);

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () {
              OnClick(txt);
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ))),
            child: Text(
              txt,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )));
  }
}
