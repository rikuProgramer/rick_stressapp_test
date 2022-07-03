import 'dart:ffi';

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
  List<String> nikkiData = [];
  List<int> stressLevel = [];



  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double dataWidth = deviceWidth * 0.95;


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

              Container(
                width: deviceWidth,
                color: Color.fromRGBO(255, 190, 208, 1.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        for (int i=0; i<=10; i++)...{
                          Text('ストレスレベル　' + (i).toString()),
                          if (stressLevel[index] == i)
                            Column(
                              children: [
                                Container(
                                  width: dataWidth,
                                  color: Colors.blue,
                                  child: Text(nikkiData[index]),
                                ),
                                ListTile(
                                  leading: Container(
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      // 以下にuserEmotionを挿入する
                                      image: DecorationImage(
                                        image: NetworkImage(emotion[index]),
                                      ),
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
                            )
                        }
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: dataWidth,
                color: Colors.blue,
                child: Text(nikkiData[index]),
              ),
              ListTile(
                leading: Container(
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // 以下にuserEmotionを挿入する
                    image: DecorationImage(
                      image: NetworkImage(emotion[index]),
                    ),
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
              nikkiData.add(newItem[4]);
              stressLevel.add(newItem[5]);
              ///newItem一覧
              //０→タイトル　１→ストレスのきっかけ　２→身体の変化　３→ユーザの感情 ４→日付 ５→ストレスレベル
            });
          }
        },
      ),
    );
  }
}
