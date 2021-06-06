import 'package:flutter/material.dart';

class DurationSlider extends StatelessWidget {
  final double duration;
  final double minVal;
  final double maxVal;
  final int divisions;
  final String label;
  final Function onChange;

  DurationSlider(
      {required this.duration,
        required this.minVal,
        required this.maxVal,
        required this.divisions,
        required this.label,
        required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
        value: duration,
        min: minVal,
        max: maxVal,
        divisions: divisions,
        label: label,
        onChanged: onChange as void Function(double)?,
      ),
    );
  }
}
