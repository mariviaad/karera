import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class HoverTextIconButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const HoverTextIconButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isHovered = ValueNotifier(false);

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: isHovered,
        builder: (context, hovering, _) {
          return TextButton.icon(
            onPressed: onTap,
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            icon: Icon(
              Icons.help_outline,
              size: 14,
              color: hovering ? AppColors.black : AppColors.white,
            ),
            label: Text(
              label,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w500,
                color: hovering ? AppColors.black : AppColors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
