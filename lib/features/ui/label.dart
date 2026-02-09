import 'package:flutter/material.dart';

class UILabel extends StatelessWidget {
  final String text;
  final bool required;
  final TextStyle? style;
  final String? errorText;

  const UILabel({
    required this.text,
    this.required = false,
    this.style,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text + (required ? ' *' : ''),
          style: style ?? TextStyle(fontWeight: FontWeight.bold),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(errorText!, style: TextStyle(color: Colors.red, fontSize: 12)),
          ),
      ],
    );
  }
}
