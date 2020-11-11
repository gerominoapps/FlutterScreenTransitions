import 'package:flutter/material.dart';

class RadioTile extends StatelessWidget {
  final Function onSelect;
  final selectedRadioTileValue;
  final value;
  final text;

  RadioTile(
      {this.value, this.text, this.onSelect, this.selectedRadioTileValue});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: selectedRadioTileValue,
      title: Text(text,
          style: TextStyle(
              fontWeight: selectedRadioTileValue == value
                  ? FontWeight.bold
                  : FontWeight.normal)),
      onChanged: (val) {
        onSelect(val);
      },
      activeColor: Colors.blueAccent,
      selected: selectedRadioTileValue == value,
    );
  }
}
