import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget{
  const CustomFilledButton({
    super.key,
    required this.image,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 80,
    this.imageHeight = 80,
    this.text,
    this.borderRadius = 18,
    this.fontSize = 18,
    this.hintText,
    this.imageScale = 0.3,
    this.restaurantDistance,
  });
  final String image;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double imageHeight;
  final String? text;
  final String? hintText;
  final int? restaurantDistance;
  final double borderRadius;
  final double fontSize;
  final double imageScale;

  @override
  Widget build(BuildContext context) {
    //ToDo color switch
    return SizedBox(
      height: height,
      width: width,
      child: FilledButton(
        onPressed:onPressed,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            SizedBox(
              height: imageHeight,
              child: Image(
                image: ExactAssetImage(image,scale: imageScale),
              ),
            ),
            if(text !=null)Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            if(hintText != null)Text(
              hintText!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),
            ),
            const Spacer(flex: 2,)
          ],
        ),
      ),
    );
  }

}