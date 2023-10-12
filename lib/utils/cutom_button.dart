import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color color;
  final double borderRadius;
  final double padding;
  final TextStyle textStyle;

  CustomButton({
    required this.text,
    this.onTap,
    this.color = Colors.purple,
    this.borderRadius = 8.0,
    this.padding = 16.0,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
            width: double.infinity, // Takes up the full width available
            padding: EdgeInsets.all(16.0), // Padding around the content
            decoration: BoxDecoration(
              color: color, // Background color
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey, // Shadow color
                  offset: Offset(0, 2), // Shadow position
                  blurRadius: 4.0, // Shadow blur radius
                ),
              ],
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white, // Text color
                fontSize: 16.0, // Text size
                fontWeight: FontWeight.bold, // Text weight
              ),
              textAlign: TextAlign.center, // Center the text
            ),
          )),
        ],
      ),
    );
  }
}
