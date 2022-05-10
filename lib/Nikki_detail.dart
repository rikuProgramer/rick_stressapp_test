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
  List<String> nikkiEmotion = [];
  List<String> nikkiStressPoint = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日記の詳細'),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index){
            return ListTile(

            );
          },
      ),
    );
  }
}