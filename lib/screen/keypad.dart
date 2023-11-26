import 'package:flutter/material.dart';

class NumberPad extends StatefulWidget {
  final bool Function(String) onNumberChanged;
  final bool autoClear;

  NumberPad({required this.onNumberChanged, this.autoClear = true});

  @override
  _NumberPadState createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  String currentNumber = '';

  void _appendDigit(String digit) {
    setState(() {
      currentNumber += digit;
      if (widget.onNumberChanged(currentNumber) && widget.autoClear) {
        _clear();
      }
    });
  }

  void _clear() {
    setState(() {
      currentNumber = '';
      if (widget.onNumberChanged(currentNumber) && widget.autoClear) {
        _clear();
      }
      ;
    });
  }

  void _backspace() {
    setState(() {
      if (currentNumber.isNotEmpty) {
        currentNumber = currentNumber.substring(0, currentNumber.length - 1);
        if (widget.onNumberChanged(currentNumber) && widget.autoClear) {
          _clear();
        }
      }
    });
  }

  Widget buildButton(String label, void Function() onPressed) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: TextEditingController(text: currentNumber),
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        // SizedBox(height: 16),
        Column(
          children: <Widget>[
            for (int i = 0; i < 3; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int j = i * 3 + 1; j <= i * 3 + 3; j++)
                    buildButton(j.toString(), () {
                      _appendDigit(j.toString());
                    }),
                ],
              ),
          ],
        ),
        // SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildButton('Backspace', () {
              _backspace();
            }),
            buildButton('0', () {
              _appendDigit('0');
            }),
            buildButton('Clear', () {
              _clear();
            }),
          ],
        ),
      ],
    );
  }
}
