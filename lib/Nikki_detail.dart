import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NikkiDetail extends StatefulWidget {
  const NikkiDetail({Key? key}) : super(key: key);

  @override
  _NikkiDetailState createState() => _NikkiDetailState();
}

class _NikkiDetailState extends State<NikkiDetail> {
  List<String> nikkiTitle = ["日記", "日記", "日記", "日記", "日記", ];
  List<String> nikkiText = [];
  List<String> nikkiEmotion = [];
  List<String> nikkiStressPoint = [];

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('日記の詳細'),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return _messageItem(nikkiTitle[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return separatorItem();
          },
          itemCount: nikkiTitle.length,
        ));
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
