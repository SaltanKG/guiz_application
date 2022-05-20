import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final Color color;
  final VoidCallback onPress;
  CustomButton({this.textButton, this.color, this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
          child: Text(
            textButton,
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
    );
  }
}
