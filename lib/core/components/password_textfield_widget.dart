import 'package:flutter/material.dart';
import 'package:food_ninja/core/style/color_manager.dart';

class PassTextFieldWidget extends StatefulWidget {
  const PassTextFieldWidget({
    super.key,
    required this.hintText,
    this.prefixImage,
    this.addPrefix = false,
    required this.formKey,
    required this.controller,
  });

  final String hintText;
  final String? prefixImage;
  final bool addPrefix;
  final GlobalKey formKey;
  final TextEditingController controller;

  @override
  State<PassTextFieldWidget> createState() => _PassTextFieldWidgetState();
}

class _PassTextFieldWidgetState extends State<PassTextFieldWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      // ToDo Color Switching
      child: TextFormField(
        controller: widget.controller,
        obscureText: obscureText,
        cursorColor: Colors.white70,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 18, top: 18, left: 12),
          prefixIcon: widget.addPrefix
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image(
                    image: ExactAssetImage(
                      widget.prefixImage!,
                    ),
                  ),
                )
              : null,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {});
              obscureText = !obscureText;
            },
            icon: obscureText
                ? const Icon(Icons.remove_red_eye_rounded)
                : Icon(
                    Icons.remove_red_eye_rounded,
                    color: ColorManager.blendedGreen,
                  ),
          ),
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
          fillColor: Colors.grey.shade900,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent)),
        ),
      ),
    );
  }
}
