import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NikkiDetail extends StatefulWidget {
  const NikkiDetail({Key? key}) : super(key: key);

  @override
  _NikkiDetailState createState() => _NikkiDetailState();
}

class _NikkiDetailState extends State<NikkiDetail> {
  List<String> nikkiTitle = [];
  List<String> nikkiText = [];
  List<String> nikkiTextTrigger = [];
  List<String> nikkiEmotion = [];
  List<String> nikkiStressPoint = [];

  ///これはただのメモです



  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('日記の詳細'),
        ),
        body:
            Card(
              margin: const EdgeInsets.all(50.0),
              child: Container(
                margin: const EdgeInsets.all(10.0),
                width: 300,
                height: 100,
                child: const Text(
                  'Card',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
    );
  }
}

Widget separatorItem() {
  return Container(
    height: 10,
    color: Colors.orange,
  );
}

Widget _messageItem(String title) {
  return Container(
    decoration: new BoxDecoration(
        border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
    child: ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 18.0),
      ),
      onTap: () {
        print("onTap called.");
      }, // タップ
      onLongPress: () {
        print("onLongTap called.");
      }, // 長押し
    ),
  );
}
