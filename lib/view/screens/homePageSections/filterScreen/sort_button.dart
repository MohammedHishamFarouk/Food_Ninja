import 'package:flutter/material.dart';

class SortButton extends StatelessWidget{
  const SortButton({super.key, required this.sortingType});
  final String sortingType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FilledButton(
        onPressed: (){},
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),),
        ),
        child: Text(
          sortingType,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

}