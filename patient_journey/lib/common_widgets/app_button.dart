import 'package:flutter/material.dart';
import 'package:patient_journey/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.onPressed,
      required this.text,
      });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        minimumSize: const Size(double.infinity, 50.0)
      ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.white
          ),
        ));
  }
}
