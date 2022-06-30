import 'package:flutter/material.dart';
import 'Nikki_detail.dart';
import 'Nikki_text_app.dart';
import 'package:test_f_0225/Nikki_text_app.dart';

class NikkiView extends StatefulWidget {
  const NikkiView({Key? key}) : super(key: key);

  @override
  _NikkiPageState createState() => _NikkiPageState();
}

class _NikkiPageState extends State<NikkiView> {
  List<String> nikkiTitle = [];
  List<String> nikkiTrigger = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ストレス観察アプリ'),
      ),

      ///drawerには後ほど日記で記録したパラメータ一覧で見れるように実装する
      drawer: Drawer(
        child: Column(
          children: const [
            Text('item1'),
            Text('item2'),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: nikkiTitle.length,
        itemBuilder: (BuildContext context, int index) {

          return ListTile(
            leading: Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                //以下にuserEmotionを挿入する

                ///imageを使ってその日の感情の写真を貼り付ける。
                ///例えば気分がいいならスマイルの画像を貼り付ける。
              ),
            ),
            title: Text(nikkiTitle[index], style: const TextStyle(fontSize: 16)),
            subtitle: Text(nikkiTitle[index], style: const TextStyle(fontSize: 12.5),),
            ///subtitleを使って日付と日記のタイトル表示させるのも面白いかも
            trailing: const Icon(Icons.navigate_next),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext Context) => NikkiDetail(),
              ))
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.account_balance_wallet),
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
      ),
    );
  }
}
