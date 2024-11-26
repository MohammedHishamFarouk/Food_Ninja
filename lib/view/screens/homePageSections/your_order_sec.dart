import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';
import 'package:food_ninja/modelView/orderCubit/order_cubit.dart';
import 'package:food_ninja/modelView/searchCubit/search_cubit.dart';
import 'package:food_ninja/view/screens/homePageSections/main_home_sec.dart';

class YourOrderSec extends StatelessWidget {
  const YourOrderSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (ctx, idx) {
                  return Column(
                    children: [
                      ...context.read<OrderCubit>().processButtons,
                      ...context.read<OrderCubit>().purchaseHistory,
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: GreenButtonWidget(
                text: 'Check out',
                height: 60,
                width: double.infinity,
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, 'navigationBarScreen');
                  context
                      .read<SearchCubit>()
                      .changeHomeSection(const MainHomeSec());
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
