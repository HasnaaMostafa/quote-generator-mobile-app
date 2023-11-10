import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.note,
      required this.author,
      required this.height,
      required this.widget,
      required this.borderRadius,
      this.bottom});
  final String note;
  final String author;
  final double height;
  final Widget widget;
  final BorderRadius borderRadius;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 353,
      decoration: BoxDecoration(
        color: const Color(0xffFBFBFB),
        borderRadius: borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: 20.0, left: 20, top: 20, bottom: bottom ?? 20),
            child: Text(
              note,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff323232)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
            child: Text(
              author,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff323232).withOpacity(0.7)),
            ),
          ),
          widget
        ],
      ),
    );
  }
}
