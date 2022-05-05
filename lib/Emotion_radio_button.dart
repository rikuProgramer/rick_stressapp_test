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
  final items = ['happy', 'angry' 'sad', 'fun'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CupertinoAlertDialog(
          title: Text('感情を教えて下さい'),
          actions: [

          ],
        )
    );
  }
}
