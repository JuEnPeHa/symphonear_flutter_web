import 'package:flutter/material.dart';

extension Neumorphism on Widget {
  Widget neumorphism({
    double? borderRadius,
    double? blurRadius,
    double? spreadRadius,
    Color? color,
    Color? shadowColor,
    Offset? offset,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        color: color ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.grey.withOpacity(0.25),
            blurRadius: blurRadius ?? 10,
            spreadRadius: spreadRadius ?? 5,
            offset: offset ?? const Offset(-5, -5),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: blurRadius ?? 10,
            spreadRadius: spreadRadius ?? 5,
            offset: offset ?? const Offset(5, 5),
          ),
        ],
      ),
      child: this,
    );
  }
}
