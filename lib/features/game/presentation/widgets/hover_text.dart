import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class HoverTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HoverTextButton({super.key, required this.text, required this.onTap});

  @override
  State<HoverTextButton> createState() => _HoverTextButtonState();
}

class _HoverTextButtonState extends State<HoverTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 0),
          style: TextStyle(
            color: _isHovered ? AppColors.fontGrey : AppColors.white,
            fontSize: 12.25,
            fontWeight: FontWeight.w400,
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
