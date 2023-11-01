import 'package:calculatour/CalcBtn.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      result,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w100),
                    ))),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn("7", OnBtnClic),
                  CalcBtn("8", OnBtnClic),
                  CalcBtn("9", OnBtnClic),
                  CalcBtn("/", OnOperatorCliced),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn("4", OnBtnClic),
                  CalcBtn("5", OnBtnClic),
                  CalcBtn("6", OnBtnClic),
                  CalcBtn("*", OnOperatorCliced),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn("1", OnBtnClic),
                  CalcBtn("2", OnBtnClic),
                  CalcBtn("3", OnBtnClic),
                  CalcBtn("+", OnOperatorCliced),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn(".", OnBtnClic),
                  CalcBtn("0", OnBtnClic),
                  CalcBtn("=", OnEqualCliced),
                  CalcBtn("-", OnOperatorCliced),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String op = "";
  String lhs = "";

  String Calculate(String lhs, String rhs, String op) {
    double Lhs = double.parse(lhs);
    double Rhs = double.parse(rhs);
    if (op == "+") {
      double res = Lhs + Rhs;
      return res.toString();
    } else if (op == "*") {
      double res = Lhs * Rhs;
      return res.toString();
    } else if (op == "-") {
      double res = Lhs - Rhs;
      return res.toString();
    } else if (op == "/") {
      double res = Lhs / Rhs;
      return res.toString();
    }
    return "";
  }

  OnOperatorCliced(txt) {
    if (op.isEmpty) {
      lhs = result;
      op = txt;
    } else {
      String res = Calculate(lhs, result, op);
      lhs = res;
      op = txt;
    }
    result = "";
    print(lhs);
    setState(() {});
  }

  OnBtnClic(txt) {
    if (op == "=") {
      op = "";
      lhs = "";
      result = "";
    }
    result += txt;
    setState(() {});
  }

  OnEqualCliced(txt) {
    result = Calculate(lhs, result, op);
    op = txt;
    setState(() {});
  }
}
