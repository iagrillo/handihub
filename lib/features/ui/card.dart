import 'package:flutter/material.dart';

class UICard extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? subtitle;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;

  const UICard({
    required this.child,
    this.title,
    this.subtitle,
    this.actions,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Text(title!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 8.0),
                child: Text(subtitle!, style: TextStyle(color: Colors.grey[700])),
              ),
            if (actions != null && actions!.isNotEmpty)
              Row(children: actions!),
            child,
          ],
        ),
      ),
    );
  }
}
