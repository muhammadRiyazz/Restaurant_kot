import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.label, required this.onpress});
  final String label;
  final dynamic onpress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress, // Your onPressed function
      child: Text(
        'Merge & Print',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonclr, // Set the button background color

        minimumSize: Size(double.infinity, 50), // Full-width button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Border radius of 10
        ),
      ),
    );
  }
}