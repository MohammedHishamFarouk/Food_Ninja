import 'package:flutter/cupertino.dart';


class ProductBadge extends StatelessWidget{
  const ProductBadge({super.key, required this.text, required this.textColor, required this.backgroundColor});
  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor.withOpacity(0.1)
      ),
      constraints: const BoxConstraints(
          minWidth: 90,
          minHeight: 40
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }

}