import 'dart:ffi';

import 'package:flutter/material.dart';
import 'Nikki_detail.dart';
import 'Nikki_text_app.dart';
import 'package:test_f_0225/Nikki_text_app.dart';
import 'package:grouped_list/grouped_list.dart';
import 'Nikki_data.dart';

class NikkiView extends StatefulWidget {
  const NikkiView({Key? key}) : super(key: key);

  @override
  _NikkiPageState createState() => _NikkiPageState();
}

class _NikkiPageState extends State<NikkiView> {

  List<NikkiData> nikkiList = [];

  List<String> nikkiTitle = [];
  List<String> nikkiText = [];
  List<String> emotion = [];
  List<String> nikkiDate = [];
  ///nikkiDateをnikkiDateに置換する
  List<int> stressLevel = [];
  List<String> stressLevelBar = [];
  List<String> stressNumber = [];

  dynamic _element;

  @override
  Widget build(BuildContext context) {

    GroupedListView GroupedListViewBuilder(BuildContext context){
      final double deviceWidth = MediaQuery.of(context).size.width;
      final double dateWidth = deviceWidth * 0.95;
      //data　ではなく date になっているので注意

      ///ここからストレスレベル別に並び替える
      GroupedListView<NikkiData, int> _grouped = GroupedListView(
        elements: nikkiList,
        groupBy: (NikkiData element) => element.stressLevel,
        groupSeparatorBuilder: (int stressLevel) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            'ストレスレベル　' + stressLevel.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, backgroundColor: Color.fromRGBO(255, 190, 208, 1.0),),
          ),
        ),
          itemBuilder: (context, element) {
            return Container(
              width: deviceWidth,
              child: Column(
                children: [
                  Container(
                    width: dateWidth,
                    color: Colors.blue,
                    child: Text(element.date),
                  ),
                  ListTile(
                    leading: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // 以下にuserEmotionを挿入する
                        image: DecorationImage(
                          image: NetworkImage(element.emotion),
                        ),
                      ),
                    ),
                    title: Text(element.title,
                        style: const TextStyle(fontSize: 17)),
                    subtitle: Text(
                      element.text,
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
              ),
            );
          }
      );

      return _grouped;
    }




    final double deviceWidth = MediaQuery.of(context).size.width;
    final double dataWidth = deviceWidth * 0.95;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ストレス観察アプリ'),
      ),

      ///後ほどdrawerを実装したい

      body:GroupedListViewBuilder(context),


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
            //タイトルが入力されていないなら'No Title'と表示させてあげてい

            setState(() {
              // リスト追加
              nikkiList.add(NikkiData(
                newItem[0],
                "ストレストリガー→　　" + newItem[1] + "\n身体の変化→　　" + newItem[2],
                newItem[3],
                newItem[4],
                newItem[5],
              )
              );
              ///newItem一覧
              //０→タイトル　１→ストレスのきっかけ　２→身体の変化　３→ユーザの感情 ４→日付 ５→ストレスレベル
            });
          }
        },
      ),
    );
  }
}
