import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/modelView/searchCubit/search_cubit.dart';

import '../../../../core/constants/assets.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    //ToDo color switch
    return SizedBox(
      height: 60,
      width: 60,
      child: FilledButton(
          onPressed: () => context.read<SearchCubit>().filterButtonPressed(),
          style: FilledButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Image(
            image: ExactAssetImage(AssetFolder.filterIcon, scale: 0.9),
          )),
    );
  }
}
