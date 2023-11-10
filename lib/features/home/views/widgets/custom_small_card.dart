import 'package:flutter/material.dart';

class CustomSmallCard extends StatelessWidget {
  const CustomSmallCard({
    super.key,
    required this.widget,
    required this.color,
    required this.borderRadius,
  });

  final Widget widget;
  final Color color;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 353,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget,
      ),
    );
  }
}
