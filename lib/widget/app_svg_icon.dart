// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgIcon extends StatelessWidget {
  final Color? color;
  final String icon;
  final double? width;
  final double? height;

  const AppSvgIcon(this.icon,
      {super.key, this.color, this.width = 24, this.height = 24});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icon/$icon.svg',
      fit: BoxFit.fitHeight,
      width: width,
      height: height,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}

/// Class untuk merepresentasikan pasangan warna
class ColorReplacement {
  final String currentColor;
  final String replaceColor;

  const ColorReplacement({
    required this.currentColor,
    required this.replaceColor,
  });
}

class AppSvg extends StatelessWidget {
  final String assets;
  final List<ColorReplacement> replaceColors; // List objek ColorReplacement
  final double? width;
  final double? height;

  const AppSvg(
    this.assets, {
    super.key,
    this.replaceColors = const [
      ColorReplacement(currentColor: 'FFFFFF', replaceColor: '000000'),
    ],
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadAndModifySvg(), // Panggil fungsi Future
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Tampilkan loading indikator saat menunggu
          return Container();
        } else if (snapshot.hasError) {
          // Tangani error jika terjadi
          return Text('Error loading SVG: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // Tampilkan SVG yang sudah dimodifikasi
          return SvgPicture.string(
            snapshot.data!,
            height: height,
            width: width,
          );
        } else {
          return const Text('No SVG data available');
        }
      },
    );
  }

  Future<String> _loadAndModifySvg() async {
    // Baca file SVG sebagai string
    String rawSvg = await rootBundle.loadString('assets/$assets.svg');

    // Ganti warna berdasarkan daftar `replaceColors`
    for (var colorReplacement in replaceColors) {
      rawSvg = rawSvg.replaceAll(
        '#${colorReplacement.currentColor}',
        '#${colorReplacement.replaceColor}',
      );
    }

    return rawSvg;
  }
}
