import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'Nikki_text_app.dart';

class NikkiView extends StatefulWidget {
  const NikkiView({Key? key}) : super(key: key);

  @override
  _NikkiPageState createState() => _NikkiPageState();
}

class _NikkiPageState extends State<NikkiView> {
  List<String> nikkiTitle = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ストレス観察アプリ'),
      ),
      drawer: Drawer(
        child: Column(
          children: const [
            Text('item1'),
            Text('item2'),
          ],
        ),
      ),
      body:
      ListView.builder(
        itemCount: nikkiTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              child: Text(nikkiTitle[index]),
              padding: const EdgeInsets.all(20.0),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          final newTitle = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const TextAddPage();
            }),
          );
          if (newTitle != null) {
            // キャンセルした場合は newTitle が null となるので注意
            setState(() {
              // リスト追加
              nikkiTitle.add(newTitle);
            });
          }
        },
        child: const Icon(Icons.account_balance_wallet),
      ),


    );
  }
}
