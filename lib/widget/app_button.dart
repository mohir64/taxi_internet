import 'package:flutter/material.dart';

import '../config/pallete.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color? color;
  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.color = Pallete.s,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          margin: const EdgeInsets.only(bottom: 16),
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text(text))),
    );
  }
}
