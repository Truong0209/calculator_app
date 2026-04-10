import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = "";
  String result = "0";
  double num1 = 0;
  String operator = "";
  List<String> history = [];

  void onButtonClick(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        result = "0";
        num1 = 0;
        operator = "";
      } else if (value == "CE") {
        input = "";
      } else if (value == "⌫") {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (value == "+" || value == "-" || value == "×" || value == "÷") {
        num1 = double.parse(input);
        operator = value;
        input = "";
      } else if (value == "=") {
        double num2 = double.parse(input);
        double res = 0;

        if (operator == "+") res = num1 + num2;
        if (operator == "-") res = num1 - num2;
        if (operator == "×") res = num1 * num2;
        if (operator == "÷") res = num1 / num2;

        result = res.toString();
        history.add("$num1 $operator $num2 = $result");
        input = result;
      } else if (value == "x²") {
        double n = double.parse(input);
        result = (n * n).toString();
        history.add("$input² = $result");
        input = result;
      } else if (value == "√") {
        double n = double.parse(input);
        result = sqrt(n).toString();
        history.add("√$input = $result");
        input = result;
      } else {
        input += value;
        result = input;
      }
    });
  }

  Widget buildButton(String text, {Color color = Colors.grey}) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onButtonClick(text),
        child: Container(
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(text, style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }

  Widget buildRow(List<String> buttons) {
    return Row(
      children: buttons.map((b) => buildButton(b)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2224802010755 - Truong"),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Lịch sử"),
                  content: Container(
                    width: double.maxFinite,
                    child: ListView(
                      children: history.map((e) => Text(e)).toList(),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(
                result,
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Column(
            children: [
              buildRow(["C", "CE", "⌫", "÷"]),
              buildRow(["7", "8", "9", "×"]),
              buildRow(["4", "5", "6", "-"]),
              buildRow(["1", "2", "3", "+"]),
              buildRow(["0", ".", "=", "x²"]),
              buildRow(["√"]),
            ],
          )
        ],
      ),
    );
  }
}