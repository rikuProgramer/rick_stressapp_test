import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextAddPage extends StatefulWidget {
  const TextAddPage({Key? key}) : super(key: key);

  @override
  _TextAddPageState createState() => _TextAddPageState();
}



class _TextAddPageState extends State<TextAddPage> {
  String _valueTextTrigger = '';
  String _valueTitle = '';
  String valueStress = '';
  int stress = 2;
  String _valueTextMind = '';
  DateTime? selectedDate;

  late Function _onChanged;

  final TextEditingController _triggerController = TextEditingController();
  final TextEditingController _valueTitleController = TextEditingController();
  final TextEditingController _whatsUpController = TextEditingController();
  final textController = TextEditingController();
  var todayDate = '今日の日付を教えて下さい';

  //sort of emotions
  //感情を選択する前は「ノーマル」に設定されている。
  String userEmotion =
      'https://1.bp.blogspot.com/-OwZV0x1FJrs/UNQrdb_uppI/AAAAAAAAI7U/-iJhiSxVI7Q/s1600/mark_face_smile.png';
  final normal =
      'https://1.bp.blogspot.com/-OwZV0x1FJrs/UNQrdb_uppI/AAAAAAAAI7U/-iJhiSxVI7Q/s1600/mark_face_smile.png';
  final sadness =
      'https://3.bp.blogspot.com/--qQ5wmWDm9k/UNQrZ_BB5iI/AAAAAAAAI6s/IoaUHEtRpzE/s1600/mark_face_cry.png';
  final anger =
      'https://3.bp.blogspot.com/-tSzqnc5n4ak/UNQrWx6BLrI/AAAAAAAAI6g/wvAwk_K1Avg/s1600/mark_face_angry.png';
  final fear =
      'https://3.bp.blogspot.com/-TnPYwXbLqzo/UNQrbXtPyoI/AAAAAAAAI68/5FsIRIvRjf0/s1600/mark_face_jito.png';
  final disgust =
      'https://2.bp.blogspot.com/-mfrs0Hl-K4Y/UNQrXi-WBMI/AAAAAAAAI6o/w4hAwmqU78U/s1600/mark_face_ase.png';
  final happyness =
      'https://4.bp.blogspot.com/-QeM2lPMumuo/UNQrby-TEPI/AAAAAAAAI7E/cZIpq3TTyas/s1600/mark_face_laugh.png';


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
        lastDate: DateTime(DateTime.now().year + 1));
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
    if (selectedDate != null) {
      todayDate = '$selectedDate'.split(' ')[0];
    }
  }

  @override
  void dispese() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('日記を作成します'),
        actions: [
          IconButton(
              onPressed: () {
                _pickDate(context);
                //ここに特に意味のない遊び心の機能を入れても面白いかも
              },
              icon: const Icon(Icons.label))
        ],
      ),
      body: Column(
        children: <Widget>[
          InputChip(
           label: Text(todayDate),
            onPressed: (){
             _pickDate(context);
            },
            backgroundColor: Colors.blue,
          ),
          Row(
            children: <Widget>[
              Container(
                width: deviceWidth * 0.8,
                color: Colors.white30,
                child: TextField(
                  controller: _valueTitleController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '感情が揺れ動いたことを教えて下さい。',
                  ),
                  onChanged: (String valueTitle) {
                    setState(() {
                      _valueTitle = valueTitle;
                      _onChanged(_valueTitle);
                    });
                  },
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.2,
                child: GestureDetector(
                  child: Image.network(userEmotion),
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return AlertDialog(
                          insetPadding: const EdgeInsets.all(8),
                          title: const Text('今の感情を教えて下さい'),
                          content: Row(
                            children: <Widget>[
                              Column(
                                children: [
                                  SizedBox(
                                    child: GestureDetector(
                                      child: Image.network(normal),
                                      onTap: () {
                                        setState(() {
                                          userEmotion = normal;
                                          Navigator.of(context).pop(userEmotion);
                                        });
                                      },
                                    ),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    child: GestureDetector(
                                      child: Image.network(happyness),
                                      onTap: () {
                                        setState(() {
                                          userEmotion = happyness;
                                          Navigator.of(context).pop(userEmotion);
                                        });
                                      },
                                    ),
                                    width: 100,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    child: GestureDetector(
                                      child: Image.network(anger),
                                      onTap: () {
                                        setState(() {
                                          userEmotion = anger;
                                          Navigator.of(context).pop(userEmotion);
                                        });
                                      },
                                    ),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    child: GestureDetector(
                                      child: Image.network(sadness),
                                      onTap: () {
                                        setState(() {
                                          userEmotion = sadness;
                                          Navigator.of(context).pop(userEmotion);
                                        });
                                      },
                                    ),
                                    width: 100,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    child: GestureDetector(
                                      child: Image.network(fear),
                                      onTap: () {
                                        setState(() {
                                          userEmotion = fear;
                                          Navigator.of(context).pop(userEmotion);
                                        });
                                      },
                                    ),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    child: GestureDetector(
                                      child: Image.network(disgust),
                                      onTap: () {
                                        setState(() {
                                          userEmotion = disgust;
                                          Navigator.of(context).pop(userEmotion);
                                        });
                                      },
                                    ),
                                    width: 100,
                                  ),
                                ],
                              )
                            ],
                          ),
                            actions: [
                            ElevatedButton(
                              child: const Text("Cancel"),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),

          Container(
            color: const Color.fromRGBO(255, 204, 229, 180),
            width: double.infinity,
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: '0~10でストレスの強さを教えて下さい',
                hintText: '例: 10→過去最高のストレス',
                icon: Icon(Icons.favorite),
                fillColor: Colors.white,
              ),
              onChanged: (String inputStress) {
                setState(() {
                  stress = int.parse(inputStress);
                  if (stress > 10){
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('おっと！'),
                        content: const Text('ストレスの強さは０から１０で教えて下さい'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('続きを書く'),
                          ),
                        ],
                      ),
                    );
                  }
                    _onChanged(stress);
                });
              },

            ),
          ),

          Container(
            color: Colors.white,
            width: double.infinity,
            child: TextField(
              controller: _triggerController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ストレスのきっかけを教えて下さい。',
                hintText: '自分は悪くないのに理不尽に叱られた。',
              ),
              onChanged: (String valueTextTrigger) {
                // データが変更したことを知らせる（画面を更新する）
                setState(() {
                  // データを変更
                  _valueTextTrigger = valueTextTrigger;
                  _onChanged(_valueTextTrigger);
                });
              },
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: TextField(
              controller: _whatsUpController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '身体に変化はありましたか？',
                hintText: '顔が熱くなって心拍数が増加した。',
              ),
              onChanged: (String valueTextMind){
                //データが変更したことを知らせる（画面の更新をする）
                setState(() {
                  //データを変更
                  _valueTextMind = valueTextMind;
                  _onChanged(_valueTextMind);
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
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
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
          if(_valueTextTrigger != '' && _valueTextMind != ''){
            Navigator.of(context).pop(
                [_valueTitleController.text, _triggerController.text, _whatsUpController.text, userEmotion, todayDate, stress]
            );
          }else{
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('おっと！'),
                content: const Text('ストレスのきっかけとそれによる身体の変化を教えて下さい'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('続きを書く'),
                  ),
                ],
              ),
            );
          }

        },
      ),
    );
  }
}
