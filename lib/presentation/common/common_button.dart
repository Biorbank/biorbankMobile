import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String? name;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? buttonColor;
  final String? image;
  const CommonButton({super.key,this.name,this.onTap, this.textColor, this.buttonColor, this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: buttonColor ?? Theme.of(context).colorScheme.onPrimary,
          boxShadow: buttonColor == null ? [
            BoxShadow(
              color: Theme.of(context).colorScheme.onPrimary,
              spreadRadius: -2,
              blurRadius: 12,
              offset: const Offset(0, 0),
            ),
          ] : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null ? Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(image!,height: 20,width: 20,fit: BoxFit.cover,),
            ) : const SizedBox.shrink(),
            AppConstant.commonText(name ?? "",fontSize: 16,fontWeight: FontWeight.w500,color: textColor)
          ],
        ),
      ),
    );
  }
}
