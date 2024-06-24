import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";       
  String _output = "0";      
  double num1 = 0.0;         
  double num2 = 0.0;         
  String operand = "";       

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              output,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(24.0)),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          setState(() {
            if (buttonText == "CLEAR") {
              output = "0";
              _output = "0";
              num1 = 0.0;
              num2 = 0.0;
              operand = "";
            } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*") {
              num1 = double.parse(output);
              operand = buttonText;
              _output = "0";
            } else if (buttonText == ".") {
              if (!_output.contains(".")) {
                _output += buttonText;
              }
            } else if (buttonText == "=") {
              num2 = double.parse(_output);

              if (operand == "+") {
                _output = (num1 + num2).toString();
              }
              if (operand == "-") {
                _output = (num1 - num2).toString();
              }
              if (operand == "*") {
                _output = (num1 * num2).toString();
              }
              if (operand == "/") {
                _output = (num1 / num2).toString();
              }

              num1 = 0.0;
              num2 = 0.0;
              operand = "";
            } else {
              _output += buttonText;
            }

            setState(() {
              output = double.parse(_output).toStringAsFixed(2);
            });
          });
        },
      ),
    );
  }
}


