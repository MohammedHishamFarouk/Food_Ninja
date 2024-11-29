import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';
import 'package:food_ninja/core/components/category_title_widget.dart';
import 'package:food_ninja/modelView/searchCubit/search_cubit.dart';
import 'package:food_ninja/view/screens/homePageSections/main_home_sec.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CategoryTitleWidget(title: 'Type'),
        Wrap(
            spacing: 10,
            runSpacing: 20,
            children: context.read<SearchCubit>().getSortButtons('type')),
        const CategoryTitleWidget(title: 'Location'),
        Wrap(
            spacing: 10,
            runSpacing: 20,
            children: context.read<SearchCubit>().getSortButtons('Location')),
        const CategoryTitleWidget(title: 'Food'),
        Wrap(
            spacing: 10,
            runSpacing: 20,
            children: context.read<SearchCubit>().getSortButtons('Food')),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0, top: 5),
          child: GreenButtonWidget(
            text: 'Search',
            height: 60,
            width: double.infinity,
            onTap: () {
              context
                  .read<SearchCubit>()
                  .changeHomeSection(const MainHomeSec());
              context.read<SearchCubit>().filterSuccess();
            },
          ),
        ),
      ],
    );
  }
}
