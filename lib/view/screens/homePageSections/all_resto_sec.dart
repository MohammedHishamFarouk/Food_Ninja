import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/category_title_widget.dart';
import 'package:food_ninja/modelView/productsCubit/products_cubit.dart';

class AllRestoSec extends StatelessWidget {
  const AllRestoSec({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> restos =
        context.read<ProductsCubit>().getRestaurants(6, context);
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (ctx, idx) {
        return Column(
          children: [
            const CategoryTitleWidget(
              title: 'Popular Restaurants',
              addTextButton: true,
              textButtonText: 'View Less',
            ),
            Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 20,
              spacing: 20,
              children: restos,
            ),
            const SizedBox(
              height: 110,
            )
          ],
        );
      },
    );
  }
}
