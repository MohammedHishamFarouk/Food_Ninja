import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/modelView/resetPassCubit/reset_pass_cubit.dart';

class CodeViaButton extends StatelessWidget {
  const CodeViaButton({
    super.key,
    required this.title,
    required this.subTitle,
    required this.leading,
    required this.onPressed,
  });

  final String title;
  final String subTitle;
  final Widget leading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPassCubit, ResetPassState>(
      builder: (context, state) {
        return FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: state is ChoiceFailureState
                  ? const BorderSide(color: Colors.red)
                  : BorderSide(
                      color:
                          context.read<ResetPassCubit>().selectSmsWay == title
                              ? Colors.green
                              : Colors.transparent,
                    ),
            ),
          ),
          child: SizedBox(
            height: 100,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Via $title:',
                style: const TextStyle(color: Colors.grey),
              ),
              minVerticalPadding: 20,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  subTitle,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              leading: leading,
            ),
          ),
        );
      },
    );
  }
}
