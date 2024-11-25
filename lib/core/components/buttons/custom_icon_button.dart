import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget{
  const CustomIconButton({super.key, required this.icon, required this.backgroundColor,required this.iconColor, required this.onPressed});

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
      ),
      color:backgroundColor.withOpacity(0.2),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }

}