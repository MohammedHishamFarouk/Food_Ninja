import 'package:flutter/material.dart';

class NotificationPopUp extends StatelessWidget {
  const NotificationPopUp({
    super.key,
    required this.image,
    required this.productName,
    required this.hintText,
  });

  final String image;
  final String productName, hintText;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.grey.shade900,
        ),
        constraints: const BoxConstraints(maxHeight: 100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image(
                image: NetworkImage(image),
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: screenWidth <= 390 ? 13 : 14,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    hintText,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth <= 390 ? 13 : 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
