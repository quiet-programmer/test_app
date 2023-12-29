import 'package:flutter/material.dart';

class NumberKeyboard extends StatelessWidget {
  final void Function(String) onKeyPressed;

  const NumberKeyboard({super.key, required this.onKeyPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[200],
      child: Column(
        children: [
          buildRow(['1', '2', '3']),
          buildRow(['4', '5', '6']),
          buildRow(['7', '8', '9']),
          buildRow(['Ok', '0', '<']),
        ],
      ),
    );
  }

  Widget buildRow(List<String> buttons) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buttons.map(
              (buttonText) {
            return Expanded(
              child: buttonText.isEmpty
                  ? SizedBox.shrink()
                  : InkWell(
                onTap: () => onKeyPressed(buttonText),
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}