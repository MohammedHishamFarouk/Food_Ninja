import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/modelView/productsCubit/products_cubit.dart';

import '../../../core/components/category_title_widget.dart';

class PopularMenuSec extends StatelessWidget {
  const PopularMenuSec({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> products = context.read<ProductsCubit>().listTheProducts(10);
    return Column(
      children: [
        const CategoryTitleWidget(
          title: 'Popular Menu',
          addTextButton: true,
          textButtonText: 'View Less',
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, idx) {
              return products[idx];
            },
          ),
        ),
        const SizedBox(
          height: 90,
        )
      ],
    );
  }
}
