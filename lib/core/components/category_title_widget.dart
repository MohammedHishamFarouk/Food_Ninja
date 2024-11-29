import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/modelView/searchCubit/search_cubit.dart';
import 'package:food_ninja/view/screens/homePageSections/main_home_sec.dart';

class CategoryTitleWidget extends StatelessWidget {
  const CategoryTitleWidget({
    super.key,
    this.addTextButton = false,
    required this.title,
    this.newSection = const MainHomeSec(),
    this.textButtonText = 'View More',
    this.inResto = false,
    this.verticalPadding = 20,
  });
  final bool addTextButton;
  final bool inResto;
  final String textButtonText;
  final String title;
  final Widget newSection;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          if (addTextButton)
            TextButton(
              onPressed: () {
                context.read<SearchCubit>().changeHomeSection(newSection);
              },
              child: Text(
                textButtonText,
                style: const TextStyle(
                    fontSize: 15,
                    color: ColorManager.burntOrange,
                    decoration: TextDecoration.none),
              ),
            )
        ],
      ),
    );
  }
}
