import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/modelView/productsCubit/products_cubit.dart';

import '../../../core/components/category_title_widget.dart';

class PopularMenuSec extends StatelessWidget {
  const PopularMenuSec({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> products = context.read<ProductsCubit>().listTheProducts(8);
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (ctx, idx) {
        return Column(
          children: [
            const CategoryTitleWidget(
              title: 'Popular Menu',
              addTextButton: true,
              textButtonText: 'View Less',
            ),
            ...products,
            const SizedBox(
              height: 90,
            )
          ],
        );
      },
    );
  }
}
