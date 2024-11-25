import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinTextFieldWidget extends StatelessWidget {
  const PinTextFieldWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: (MediaQuery.sizeOf(context).width - 40) / 4,
      child: TextFormField(
        controller: controller,
        maxLines: null,
        minLines: null,
        expands: true,
        keyboardType: TextInputType.number,
        autofocus: true,
        maxLength: 1,
        cursorColor: Colors.white,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(top: 45),
            filled: true,
            counterText: '',
            border: InputBorder.none,
            fillColor: Colors.white12),
        style: const TextStyle(fontSize: 40, color: Colors.white),
        textAlign: TextAlign.center,
        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
        onSaved: (pin1) {},
        onChanged: (value) {
          if (value.length == 1) FocusScope.of(context).nextFocus();
        },
      ),
    );
  }
}
