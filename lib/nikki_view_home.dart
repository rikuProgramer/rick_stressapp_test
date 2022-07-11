import 'package:flutter/material.dart';
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
  List<int> stressLevel = [];
  List<String> stressLevelBar = [];
  List<String> stressNumber = [];

  bool get = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GroupedListView groupedListViewBuilder(BuildContext context) {
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
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Color.fromRGBO(255, 190, 208, 1.0),
                  ),
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
                    child: Text('${element.date}'.split(' ')[0]),
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
                      'ストレストリガー→${element.text}\n身体の変化→${element.text2}',
                      style: const TextStyle(fontSize: 12.5),
                    ),
                    trailing: const Icon(Icons.navigate_next),
                    onTap: () async {
                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TextAddPage(nikkiData: element)

                        ),
                      );

                       */

                      final NikkiData result = await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TextAddPage(
                          nikkiData: element,
                        ),
                      ));
                      setState(() {
                      });


                    },
                  ),
                ],
              ),
            );
          });

      return _grouped;
    }

    Widget newList(BuildContext, context) {
      final double deviceWidth = MediaQuery.of(context).size.width;
      final double dateWidth = deviceWidth * 0.95;

      return ListView.builder(
          itemCount: nikkiList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: dateWidth,
                  color: Colors.blue,
                  child: Text(''),
                ),
                ListTile(
                  leading: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      // 以下にuserEmotionを挿入する
                      image: DecorationImage(
                        image: NetworkImage(nikkiList[index].emotion),
                      ),
                    ),
                  ),
                  title: Text(nikkiList[index].title,
                      style: const TextStyle(fontSize: 17)),
                  subtitle: Text(
                    'ストレストリガー→${nikkiList[index].text}\n身体の変化→${nikkiList[index].text2}',
                    style: const TextStyle(fontSize: 12.5),
                  ),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () async {
                    final NikkiData result =
                        await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TextAddPage(
                        nikkiData: nikkiList[index],
                      ),
                    ));
                    setState(() {
                    });
                  },
                ),
              ],
            );
          });
    }

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double dataWidth = deviceWidth * 0.95;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ストレス観察アプリ'),
      ),

      ///後ほどdrawerを実装したい

      body: groupedListViewBuilder(context),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.account_balance_wallet),
        onPressed: () async {
          final NikkiData newItem = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TextAddPage(
                  nikkiData: NikkiData('', '', '', normal, DateTime.now(), 0));
            }),
          );
          print(newItem);
          if (newItem != null) {
            // キャンセルした場合は newTitle が null となるので注意

            if (newItem.title == '') {
              setState(() {
                newItem.title = 'No title';
              });
            }
            //タイトルが入力されていないなら'No Title'と表示させてあげてい

            setState(() {
              // リスト追加
              nikkiList.add(NikkiData(
                newItem.title,
                newItem.text,
                newItem.text2,
                newItem.emotion,
                newItem.date,
                newItem.stressLevel,
              ));

              ///newItem一覧
              //０→タイトル　１→ストレスのきっかけ　２→身体の変化　３→ユーザの感情 ４→日付 ５→ストレスレベル
            });
          }
        },
      ),
    );
  }
}
