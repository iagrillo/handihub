import 'package:flutter/material.dart';

class UIBadge extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const UIBadge({
    required this.label,
    this.color = Colors.green,
    this.icon,
    this.textStyle,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white, size: 16),
            SizedBox(width: 4),
          ],
          Text(label, style: textStyle ?? TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
