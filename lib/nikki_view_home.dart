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
  List<String> nikkiText = [];
  List<String> emotion = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ストレス観察アプリ'),
      ),

      ///後ほどdrawerを実装したい

      body: ListView.builder(
        itemCount: nikkiTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Container(
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // 以下にuserEmotionを挿入する
                    image: DecorationImage(
                      image: NetworkImage(emotion[index]),
                    ),

                      // Image.network(emotion[index]),
                    ///The argument type 'Image' can't be assigned to the parameter type 'DecorationImage?'
                    ///というエラーが発生

                    //imageを使ってその日の感情の写真を貼り付ける。
                    //例えば気分がいいならスマイルの画像を貼り付ける。
                  ),
                ),
                title: Text(nikkiTitle[index],
                    style: const TextStyle(fontSize: 17)),
                subtitle: Text(
                  nikkiText[index],
                  style: const TextStyle(fontSize: 12.5),
                ),
                trailing: const Icon(Icons.navigate_next),
                onTap: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext Context) => NikkiDetail(),
                  ))
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.account_balance_wallet),
        onPressed: () async {
          final newItem = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const TextAddPage();
            }),
          );
          if (newItem != null) {
            // キャンセルした場合は newTitle が null となるので注意

            if (newItem[0] == null) {
              setState(() {
                newItem[0] = 'No Title';
              });
            }
            ;
            //タイトルが入力されていないなら'No Title'と表示させてあげてい

            setState(() {
              // リスト追加
              nikkiTitle.add(newItem[0]);
              nikkiText.add("ストレストリガー→     " +
                  newItem[1] +
                  "\n身体の変化→     " +
                  newItem[2]);
              emotion.add(newItem[3]);

              ///newItem一覧
              //０→タイトル　１→ストレスのきっかけ　２→身体の変化　３→ユーザの感情
            });
          }
        },
      ),
    );
  }
}
