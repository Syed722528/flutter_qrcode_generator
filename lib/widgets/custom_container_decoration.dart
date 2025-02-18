import 'package:flutter/material.dart';

Decoration customContainerDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 1, blurRadius: 1)],
  );
}