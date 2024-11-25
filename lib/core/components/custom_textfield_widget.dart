import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    this.prefixImage,
    this.addPrefix = false,
    required this.formKey,
    required this.controller,
    this.imageScale = 1,
    this.addSuffixIcon = false,
    this.obscureText = false,
    this.suffixIcon,
    this.onSuffixTapped,
  });

  final String hintText;
  final String? prefixImage;
  final bool addPrefix;
  final bool addSuffixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final GlobalKey formKey;
  final TextEditingController controller;
  final double imageScale;
  final VoidCallback? onSuffixTapped;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Form(
        key: formKey,
        // ToDo Color Switching
        child: TextFormField(
          controller: controller,
          minLines: null,
          maxLines: null,
          expands: true,
          obscureText: obscureText,
          cursorColor: Colors.white70,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: addPrefix
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image(
                      image: ExactAssetImage(
                        prefixImage!,
                        scale: imageScale,
                      ),
                    ),
                  )
                : null,
            suffixIcon: addSuffixIcon?
            IconButton(
                onPressed:onSuffixTapped,
                icon: suffixIcon!,
            ):null,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            fillColor: Colors.grey.shade900,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.transparent)
            ),
          ),
        ),
      ),
    );
  }
}
