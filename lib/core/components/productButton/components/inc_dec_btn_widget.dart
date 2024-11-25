import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/modelView/orderCubit/order_cubit.dart';

class IncAndDecBtnWidget extends StatelessWidget {
  const IncAndDecBtnWidget({
    super.key,
    required this.id,
    required this.price,
  });

  final int? id;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GreenButtonWidget(
          text: '-',
          height: 25,
          width: 25,
          fontSize: 16,
          radius: 8,
          gradientColor: ColorManager.opacGreenGradient,
          onTap: () {
            context.read<OrderCubit>().subTotal();
            context.read<OrderCubit>().removePrice(id!, price);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return Text(
                '${context.read<OrderCubit>().changeCount(id!)}',
              );
            },
          ),
        ),
        GreenButtonWidget(
          text: '+',
          height: 25,
          width: 25,
          fontSize: 14,
          radius: 8,
          onTap: () {
            context.read<OrderCubit>().addPrice(price, id!);
            context.read<OrderCubit>().subTotal();
          },
        ),
      ],
    );
  }
}
