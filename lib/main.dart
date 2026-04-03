import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = "0";
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  void handleButton(String value) {
    setState(() {
      if (value == "C") {
        display = "0";
        num1 = 0;
        num2 = 0;
        operator = "";
      } else if (value == "+" || value == "-" || value == "×" || value == "÷") {
        num1 = double.parse(display);
        operator = value;
        display = "0";
      } else if (value == "=") {
        num2 = double.parse(display);

        if (operator == "+") {
          display = (num1 + num2).toString();
        } else if (operator == "-") {
          display = (num1 - num2).toString();
        } else if (operator == "×") {
          display = (num1 * num2).toString();
        } else if (operator == "÷") {
          display = num2 != 0 ? (num1 / num2).toString() : "Error";
        }
      } else {
        if (display == "0") {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }

  Widget buildButton(String text,
      {Color color = Colors.grey, double flex = 1}) {
    return Expanded(
      flex: flex.toInt(),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () => handleButton(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("MSSV - Họ tên sinh viên"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Màn hình hiển thị
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                display,
                style: const TextStyle(
                    fontSize: 50, color: Colors.white),
              ),
            ),
          ),

          // Bàn phím
          Column(
            children: [
              Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("÷", color: Colors.orange),
              ]),
              Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("×", color: Colors.orange),
              ]),
              Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-", color: Colors.orange),
              ]),
              Row(children: [
                buildButton("0"),
                buildButton("."),
                buildButton("C", color: Colors.red),
                buildButton("+", color: Colors.orange),
              ]),
              Row(children: [
                buildButton("=", color: Colors.blue, flex: 4),
              ]),
            ],
          )
        ],
      ),
    );
  }
}