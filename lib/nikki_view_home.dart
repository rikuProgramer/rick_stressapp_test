import 'package:flutter/material.dart';
import 'Nikki_text_app.dart';

class NikkiView extends StatefulWidget {
  const NikkiView({Key? key}) : super(key: key);

  @override
  _NikkiPageState createState() => _NikkiPageState();
}

class _NikkiPageState extends State<NikkiView> {
  List<String> nikkiText = [];

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
      body: ListView.builder(
        itemCount: nikkiText.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              child: Text(nikkiText[index]),
              padding: const EdgeInsets.all(20.0),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const TextAddPage();
            }),
          );
          if (newListText != null) {
            // キャンセルした場合は newListText が null となるので注意
            setState(() {
              // リスト追加
              nikkiText.add(newListText);
            });
          }
        },
        child: const Icon(Icons.account_balance_wallet),
      ),


    );
  }
}
