import 'package:flutter/cupertino.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget(
      {super.key, required this.message, required this.gradient});
  final String message;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: gradient,
      ),
      constraints: BoxConstraints(
          minHeight: 40,
          minWidth: 50,
          maxWidth: MediaQuery.sizeOf(context).width - 50),
      padding: const EdgeInsets.all(5),
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: 1,
        heightFactor: 1,
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
