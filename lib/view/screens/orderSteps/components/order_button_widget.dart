import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/modelView/orderCubit/order_cubit.dart';

class OrderButtonWidget extends StatelessWidget {
  const OrderButtonWidget({
    super.key,
    this.editMode = false,
    this.addHeader = false,
    required this.text,
    this.hintTitle = 'Deliver To',
    this.image = AssetFolder.locationImage,
    this.imageScale = 1,
    this.onPressed,
  });
  final bool editMode;
  final bool addHeader;
  final String text, hintTitle, image;
  final double imageScale;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    //ToDo change color
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: FilledButton(
        onPressed: () {
          if (!editMode && !addHeader) {
            context.read<OrderCubit>().editPayment(image, imageScale);
            Navigator.of(context).pop();
          }
        },
        style: FilledButton.styleFrom(
          minimumSize: const Size(double.infinity, 80),
          padding: EdgeInsets.only(
            top: editMode ? 14 : 20,
            bottom: editMode ? 30 : 20,
            left: 14,
            right: 18,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (addHeader)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hintTitle,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  if (editMode)
                    TextButton(
                      onPressed: onPressed,
                      style: TextButton.styleFrom(
                        textStyle:
                            const TextStyle(decoration: TextDecoration.none),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerRight,
                        overlayColor: Colors.transparent,
                      ),
                      child: const Text('Edit'),
                    ),
                ],
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image(
                    image: ExactAssetImage(image, scale: imageScale),
                  ),
                ),
                Flexible(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            if (!editMode && hintTitle.contains('Deliver To'))
              TextButton(
                onPressed: onPressed,
                child: const Text(
                  'set Location',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
