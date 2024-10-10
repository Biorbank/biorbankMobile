import 'package:biorbank/presentation/pages/history/cubit/history_cubit.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/assets.dart';
import '../../../../../utils/app_widgets.dart';

class TypeBottomSheet extends StatefulWidget {
  // final void Function(String?) onChanged;

  const TypeBottomSheet({super.key});

  @override
  State<TypeBottomSheet> createState() => _TypeBottomSheetState();
}

class _TypeBottomSheetState extends State<TypeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HistoryCubit>();
    return Column(
      children: [
        height(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              AppConstant.commonText("Transaction Type",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.shadow),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  Assets.imagesClose,
                  height: 12,
                  width: 12,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
        height(10),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: cubit.transactionTypes.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                dense: true,
                visualDensity: const VisualDensity(vertical: -4),
                title: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: AppConstant.commonText(
                    cubit.transactionTypes[index],
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow,
                    fontSize: 14,
                  ),
                ),
                trailing: Radio<String>(
                  value: cubit.transactionTypes[index],
                  groupValue: cubit.selectedValue,
                  fillColor: WidgetStatePropertyAll(
                    cubit.selectedValue == cubit.transactionTypes[index]
                        ? Theme.of(context).primaryColor
                        : Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(0.5),
                  ),
                  onChanged: (value) {
                    setState(() {
                      cubit.selectedValue = value ?? "Send";
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
