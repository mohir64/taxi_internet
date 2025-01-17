import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> getResizedIcon(String path, double size) async {
  final ByteData data = await rootBundle.load(path);
  final List<int> bytes = data.buffer.asUint8List();
  final ui.Image image = await decodeImageFromList(Uint8List.fromList(bytes));

  final ui.Image resizedImage = await _resizeImageWithAspectRatio(image, size);

  final ByteData? byteData =
      await resizedImage.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List resizedBytes = byteData!.buffer.asUint8List();

  // ignore: deprecated_member_use
  return BitmapDescriptor.fromBytes(resizedBytes);
}

Future<ui.Image> _resizeImageWithAspectRatio(
    ui.Image image, double size) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, size, size));
  final paint = Paint()..filterQuality = FilterQuality.high;

  final double originalWidth = image.width.toDouble();
  final double originalHeight = image.height.toDouble();
  final double aspectRatio = originalWidth / originalHeight;

  double targetWidth;
  double targetHeight;

  if (aspectRatio > 1) {
    targetWidth = size;
    targetHeight = size / aspectRatio;
  } else {
    targetWidth = size * aspectRatio;
    targetHeight = size;
  }

  final double offsetX = (size - targetWidth) / 2;
  final double offsetY = (size - targetHeight) / 2;

  canvas.drawImageRect(
    image,
    Rect.fromLTWH(0, 0, originalWidth, originalHeight), 
    Rect.fromLTWH(
        offsetX, offsetY, targetWidth, targetHeight), 
    paint,
  );

  final picture = recorder.endRecording();
  return await picture.toImage(size.toInt(), size.toInt());
}
