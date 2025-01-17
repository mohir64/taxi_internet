import 'package:flutter/material.dart';

import '../config/pallete.dart';

class AppInputLocation extends StatelessWidget {
  final Widget icon;
  final String? location;
  final Function()? onTap;
  const AppInputLocation({
    super.key,
    required this.icon,
    this.location,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        margin: const EdgeInsets.only(bottom: 16),
        height: 64,
        decoration: BoxDecoration(
          color: const Color(0xFF21242A),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Pallete.s),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                const SizedBox(width: 18),
                if (location != '') ...[
                  Text(location!),
                ] else ...[
                  const Text(
                    'Waiting for pickup point...',
                    style: TextStyle(color: Pallete.s),
                  ),
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}
