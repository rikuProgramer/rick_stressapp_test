import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SortOfEmotions { Happy, Angry }

class EmotionRadioButton extends StatefulWidget {
  const EmotionRadioButton({Key? key}) : super(key: key);

  @override
  State<EmotionRadioButton> createState() => _EmotionRadioButtonState();
}

class _EmotionRadioButtonState extends State<EmotionRadioButton> {
  SortOfEmotions? _character = SortOfEmotions.Happy;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Happy'),
          leading: Radio<SortOfEmotions>(
            value: SortOfEmotions.Happy,
            groupValue: _character,
            onChanged: (SortOfEmotions? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Angry'),
          leading: Radio<SortOfEmotions>(
            value: SortOfEmotions.Angry,
            groupValue: _character,
            onChanged: (SortOfEmotions? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
