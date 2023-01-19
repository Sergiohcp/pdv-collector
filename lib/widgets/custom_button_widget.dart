import 'package:flutter/material.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/widgets/custom_text_widget.dart';

enum CustomButtonVariant { contained, outlined }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonVariant? variant;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.variant = CustomButtonVariant.contained});

  getButton() {
    final Widget defaultButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: this.onPressed,
      child: CustomText(
        this.text,
        color: 'white',
        fontWeight: 'bold',
      ),
    );

    switch (this.variant) {
      case CustomButtonVariant.contained:
        return defaultButton;
      case CustomButtonVariant.outlined:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            side: BorderSide(width: 2, color: PdvCollectorColors.tannatDefault),
          ),
          onPressed: this.onPressed,
          child: CustomText(this.text,
              color: 'tannat.default', fontWeight: 'bold'),
        );
      default:
        return defaultButton;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: getButton(),
        ),
      ],
    );
  }
}
