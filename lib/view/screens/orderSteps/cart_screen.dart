import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/background_angled_pattern.dart';
import 'package:food_ninja/core/components/buttons/custom_back_button.dart';
import 'package:food_ninja/modelView/orderCubit/order_cubit.dart';
import 'package:food_ninja/view/screens/orderSteps/components/bottom_sheet_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const BackGroundAngledPattern(),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 38, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomBackButton(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                  child: Text(
                    'Order details',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (ctx, idx) {
                          return Dismissible(
                            direction: DismissDirection.endToStart,
                            key: Key(idx.toString()),
                            background: const Card(
                              color: Colors.amber,
                            ),
                            child: context
                                .read<OrderCubit>()
                                .cartProducts
                                .elementAt(idx),
                          );
                        },
                        itemCount:
                            context.read<OrderCubit>().cartProducts.length,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 220,
                ),
              ],
            ),
          ),
          BottomSheetWidget(
            onPressed: () {
              Navigator.pushNamed(context, 'confirmOrderScreen');
            },
          ),
        ],
      ),
    );
  }
}
