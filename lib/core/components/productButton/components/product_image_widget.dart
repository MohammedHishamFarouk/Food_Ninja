import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    super.key,
    required this.image,
    required this.addButtons,
  });

  final String image;
  final bool addButtons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: addButtons ? 65 : 80,
      width: addButtons ? 65 : 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
