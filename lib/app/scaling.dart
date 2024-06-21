import 'package:flutter/material.dart';

// Default guideline sizes based on the Figma design
const double guidelineBaseWidth = 428;
const double guidelineBaseHeight = 926;

double screenWidth = 0.0;
double screenHeight = 0.0;

void initializeScaling(BuildContext context) {
  final size = MediaQuery.of(context).size;
  screenWidth = size.width;
  screenHeight = size.height;
}

double get shortDimension =>
    screenWidth < screenHeight ? screenWidth : screenHeight;

double get longDimension =>
    screenWidth < screenHeight ? screenHeight : screenWidth;

double scale(double size) {
  return (shortDimension / guidelineBaseWidth) * size;
}

double verticalScale(double size) {
  return (longDimension / guidelineBaseHeight) * size;
}

double moderateScale(double size, {double factor = 0.5}) {
  return size + (scale(size) - size) * factor;
}

double moderateVerticalScale(double size, {double factor = 0.5}) {
  return size + (verticalScale(size) - size) * factor;
}

const s = scale;
const vs = verticalScale;
const ms = moderateScale;
const mvs = moderateVerticalScale;
