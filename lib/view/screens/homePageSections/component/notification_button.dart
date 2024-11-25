import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

class NotificationButton extends StatelessWidget{
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    //ToDo color switch
    return SizedBox(
      height: 45,
      width: 45,
      child: FilledButton(
        onPressed:()=>Navigator.of(context).pushNamed('notificationScreen'),
        style: FilledButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.grey.withOpacity(0.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Image(
            image: ExactAssetImage(AssetFolder.notificationIcon),
        )
      ),
    );
  }
}