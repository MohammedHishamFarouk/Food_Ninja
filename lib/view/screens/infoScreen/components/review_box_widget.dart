import 'package:flutter/material.dart';
import 'package:food_ninja/core/style/color_manager.dart';

class ReviewBoxWidget extends StatelessWidget {
  const ReviewBoxWidget({
    super.key,
    required this.image,
    required this.userName,
    required this.hintText,
  });

  final String image;
  final String userName;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width - 5, minHeight: 100),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.grey.shade900,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width / 1.9),
                        child: Text(
                          userName,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      Text(
                        hintText,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Card(
                  color: ColorManager.blendedGreen.withOpacity(0.1),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: ColorManager.blendedGreen,
                        size: 25,
                      ),
                      Text(
                        '5  ',
                        style: TextStyle(
                          color: ColorManager.blendedGreen,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 94.0, bottom: 5),
              child: SizedBox(
                width: 200,
                child: Text(
                  'This Is great, So delicious! You Must Here, With Your family . . ',
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
