import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/modelView/orderCubit/order_cubit.dart';

class OrderFeesWidget extends StatelessWidget {
  const OrderFeesWidget({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return Column(
          children: [
            _CustomListTile(
              text: 'Sub-Total',
              price: '${context.read<OrderCubit>().subTotal()} \$',
            ),
            const _CustomListTile(
              text: 'Delivery Charge',
              price: '10 \$',
            ),
            const _CustomListTile(
              text: 'Discount',
              price: '5 \$',
            ),
            const Spacer(),
            _CustomListTile(
              text: 'Total',
              price: '${context.read<OrderCubit>().subTotal() + 10 - 5} \$',
              fontSize: 20,
            ),
            const Spacer(),
            FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: const Size(double.infinity, 65)),
              child: Text(
                'Place My Order',
                style: TextStyle(
                  color: ColorManager.blendedGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.text,
    required this.price,
    this.fontSize = 14,
  });

  final String text, price;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
