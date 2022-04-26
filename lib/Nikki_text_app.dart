import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_f_0225/database_controller.dart';
import 'package:test_f_0225/db_data.dart';

class TextAddPage extends StatefulWidget {
  const TextAddPage({Key? key}) : super(key: key);

  @override
  _TextAddPageState createState() => _TextAddPageState();
}

class _TextAddPageState extends State<TextAddPage> {
  String _text = '';
  String _title = '';
  DateTime? selectedDate;
  int stress = 0;

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final textController = TextEditingController();
  var todayDate = '日付を入力してください';


  Future _pickDate(BuildContext context) async {
    //DatePickerの初期値
    final nowDate = DateTime.now();

    //DatePickerを表示し、選択されたら変数に格納する
    final newDate = await showDatePicker(
        context: context,
        //初期値を設定
        initialDate: nowDate,
        //選択できる日付の上限
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 1)
    );

    //nullチェック
    if (newDate != null) {
      //選択された日付を変数に格納
      setState(() {
        selectedDate = newDate;
      });
    } else {
      //nullならば何もしない
      return;
    }

    //日付を入力。未選択はメッセージを表示。
    if (selectedDate != null){
      todayDate = '$selectedDate'.split(' ')[0];
    }


  }

  @override
  void dispese(){
    textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日記を作成'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              ///カレンダーを起動させる1行
              _pickDate(context);
            },
            child: Text(todayDate),
          ),
          Container(
            color: Colors.white30,
            width: double.infinity,
            child: TextField(
              controller: _titleController,
              maxLines: 1,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '日記のタイトルを入力',
                  hintText: '20文字までホームに表示できます。'
              ),
              onChanged: (String valueTitle) {
                setState(() {
                  _title = valueTitle;
                });
              },
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '0~10でストレスの強さを教えて下さい',
                hintText: '例: 10→過去最高のストレス',
                icon: Icon(Icons.favorite),
                fillColor: Colors.white,
              ),
              onChanged: (String inputStress){
                setState(() {
                  stress = inputStress as int;
                  //int.parse(stress);
                });
              },
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '今日の話を聞かせてください',
                hintText: '雨が降っていて憂鬱だった。',
              ),
              onChanged: (String valueText) {
                // データが変更したことを知らせる（画面を更新する）
                setState(() {
                  // データを変更
                  _text = valueText;
                });
              },
            ),
          ),


          const SizedBox(height: 5),
          ///この上下のsizedBoxってどう違うの？
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('本当に日記を破棄してもよろしいですか？'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('日記を続ける'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      child: const Text('破棄する'),
                    ),
                  ],
                ),
              ),
              child: const Text('日記を破棄する'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('作成'),
        onPressed: () async {

          ///NikkiDatabaaseController nikkiDatabaaseController =
              NikkiDatabaaseController();
          ///await nikkiDatabaaseController.asyncInit();
          Nikki_dialy newItem = Nikki_dialy(
              text: _controller.text,
              points: 0,
              tab0: 0,
              tab1: 0,
              tab2: 0,
              tab3: 0,
              tab4: 0,
              tab5: 0,
              tab6: 0,
              tab7: 0,
              tab8: 0,
              tab9: 0,
              day: DateTime.now());
          ///await nikkiDatabaaseController.addNikki_dialy(newItem);
          ///await nikkiDatabaaseController.getNikki_dialys();
          print(_controller.text);
          print(_text);
          print(selectedDate);
          print(stress);
          if (stress is int){
            print('stress はint型です');
          };
          Navigator.of(context).pop(_titleController.text);
        },
      ),
    );
  }
}
