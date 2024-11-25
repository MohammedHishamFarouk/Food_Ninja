import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/background_angled_pattern.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';
import 'package:food_ninja/core/components/category_title_widget.dart';
import 'package:food_ninja/core/components/custom_textfield_widget.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/modelView/searchCubit/search_cubit.dart';
import 'package:food_ninja/view/screens/homePageSections/component/notification_button.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundAngledPattern(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 210,
                        child: Text(
                          'Find Your Favourite Food',
                          style: TextStyle(
                            fontSize: 31,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: NotificationButton(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: MediaQuery.sizeOf(context).width - 50,
                        //ToDo color switch
                        child: CustomTextFieldWidget(
                          hintText: ' What do you want to order?',
                          formKey: context.read<SearchCubit>().searchKey,
                          controller: context.read<SearchCubit>().search,
                          prefixImage: AssetFolder.searchIcon,
                          addPrefix: true,
                          imageScale: 0.9,
                        ),
                      ),
                    ],
                  ),
                ),
                const CategoryTitleWidget(title: 'Type'),
                Wrap(
                    spacing: 10,
                    runSpacing: 20,
                    children:
                        context.read<SearchCubit>().getSortButtons('type')),
                const CategoryTitleWidget(title: 'Location'),
                Wrap(
                    spacing: 10,
                    runSpacing: 20,
                    children:
                        context.read<SearchCubit>().getSortButtons('Location')),
                const CategoryTitleWidget(title: 'Food'),
                Wrap(
                    spacing: 10,
                    runSpacing: 20,
                    children:
                        context.read<SearchCubit>().getSortButtons('Food')),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0, top: 5),
                  child: GreenButtonWidget(
                    text: 'Search',
                    height: 60,
                    width: double.infinity,
                    onTap: () => context.read<SearchCubit>().filterSuccess(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
