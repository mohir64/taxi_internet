import 'package:flutter/material.dart';

import '../config/pallete.dart';

class AppButtonIcon extends StatelessWidget {
  final Function()? onTap;
  final Widget icon;
  final bool isNotify;
  final double size;
  final double borderRadius;
  final BoxBorder? border;
  const AppButtonIcon({
    super.key,
    this.onTap,
    required this.icon,
    this.isNotify = false,
    this.size = 36,
    this.borderRadius = 36,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(7),
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Pallete.black1,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: icon,
            ),
            Visibility(
              visible: isNotify,
              child: Positioned(
                right: 2,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: Pallete.color5,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
