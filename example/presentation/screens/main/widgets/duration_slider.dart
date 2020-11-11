import 'package:flutter/material.dart';

class DurationSlider extends StatelessWidget {

  double duration;
  final double minVal;
  final double maxVal;
  final int divisions;
  final String label;
  final Function onChange;

  DurationSlider({this.duration, this.minVal, this.maxVal, this.divisions, this.label, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
        value: duration,
        min: minVal,
        max: maxVal,
        divisions: divisions,
        label: label,
        onChanged: onChange,
      ),
    );
  }
}
