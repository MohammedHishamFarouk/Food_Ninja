import 'package:flutter/material.dart';

class SignOptionsButton extends StatelessWidget {
  const SignOptionsButton({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: FilledButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      child: Container(
        height: 65,
        constraints:
            BoxConstraints(minWidth: MediaQuery.sizeOf(context).width / 2.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image(
                  height: MediaQuery.sizeOf(context).width / 14,
                  width: MediaQuery.sizeOf(context).width / 14,
                  image: AssetImage(image),
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 15,
                    overflow: TextOverflow.clip,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
