import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NikkiDetail extends StatefulWidget {
  const NikkiDetail({Key? key}) : super(key: key);

  @override
  _NikkiDetailState createState() => _NikkiDetailState();
}

class _NikkiDetailState extends State<NikkiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ストレス観察アプリ'),
      ),
    );
  }
}