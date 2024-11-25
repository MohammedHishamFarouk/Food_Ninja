import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/background_angled_pattern.dart';
import 'package:food_ninja/core/components/buttons/custom_back_button.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/modelView/orderCubit/order_cubit.dart';
import 'package:food_ninja/modelView/searchCubit/search_cubit.dart';
import 'package:food_ninja/view/screens/homePageSections/your_order_sec.dart';
import 'package:food_ninja/view/screens/orderSteps/components/bottom_sheet_widget.dart';
import 'package:food_ninja/view/screens/orderSteps/components/order_button_widget.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                    'Confirm Order',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                OrderButtonWidget(
                  addHeader: true,
                  editMode: true,
                  text: AssetFolder.defaultLocation,
                  onPressed: () =>
                      Navigator.pushNamed(context, 'shippingScreen'),
                ),
                BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    return OrderButtonWidget(
                      addHeader: true,
                      editMode: true,
                      text: '2121 6352 8465 ****',
                      hintTitle: 'Payment Method',
                      image: context.read<OrderCubit>().defaultPaymentMethod,
                      imageScale: context.read<OrderCubit>().defaultImageScale,
                      onPressed: () =>
                          Navigator.pushNamed(context, 'paymentScreen'),
                    );
                  },
                ),
              ],
            ),
          ),
          BottomSheetWidget(
            onPressed: () {
              context
                  .read<SearchCubit>()
                  .changeHomeSection(const YourOrderSec());
              Navigator.pushNamed(context, 'home');
            },
          ),
        ],
      ),
    );
  }
}
