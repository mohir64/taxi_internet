import 'package:flutter/material.dart';

import '../config/pallete.dart';

class AppTextSearch extends StatelessWidget {
  final String hintText;
  final Widget? icon;
  final Widget? suffixIcon;
  final Function()? onTap;
  final TextEditingController? controller;

  const AppTextSearch(
      {this.hintText = 'Enter text',
      this.controller,
      super.key,
      this.icon,
      this.onTap,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        child: TextField(
          enabled: onTap == null,
          controller: controller,
          style: const TextStyle(
            fontSize: 12, // Ukuran font teks
            height: 1.0, // Jarak baris teks
          ),
          decoration: InputDecoration(
            isDense: true,
            hintStyle: const TextStyle(
              color: Pallete.grey2,
              fontSize: 12,
            ),
            prefixIcon: icon,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 60, // Atur lebar minimum
              minHeight: 25, // Atur tinggi minimum
            ),
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 60, // Atur lebar minimum
              minHeight: 1, // Atur tinggi minimum
            ),
            filled: true,
            fillColor: Pallete.black1,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: Theme.of(context).dividerTheme.color!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: Theme.of(context).dividerTheme.color!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: Theme.of(context).dividerTheme.color!),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: Theme.of(context).dividerTheme.color!),
            ),
          ),
        ),
      ),
    );
  }
}
