class Nikki_dialy {
  final int? id;
  final String text;
  final int points;
  final int tab0;
  final int tab1;
  final int tab2;
  final int tab3;
  final int tab4;
  final int tab5;
  final int tab6;
  final int tab7;
  final int tab8;
  final int tab9;
  final DateTime day;

  Nikki_dialy({
    this.id,
    required this.text,
    required this.points,
    required this.tab0,
    required this.tab1,
    required this.tab2,
    required this.tab3,
    required this.tab4,
    required this.tab5,
    required this.tab6,
    required this.tab7,
    required this.tab8,
    required this.tab9,
    required this.day,
  });

  Nikki_dialy.fromJsonMap(Map<String, dynamic> map)
      : id = map['id'] as int,
        points = map['points'] as int,
        text = map['text'] as String,
        tab0 = map['tab0'] as int,
        tab1 = map['tab1'] as int,
        tab2 = map['tab2'] as int,
        tab3 = map['tab3'] as int,
        tab4 = map['tab4'] as int,
        tab5 = map['tab5'] as int,
        tab6 = map['tab6'] as int,
        tab7 = map['tab7'] as int,
        tab8 = map['tab8'] as int,
        tab9 = map['tab9'] as int,
        day =
        DateTime.fromMillisecondsSinceEpoch(map['day'] as int);

  Map<String, dynamic> toJsonMap() => {
    'id': id,
    'text': text,
    'points': points,
    'tab0': tab0,
    'tab1': tab1,
    'tab2': tab2,
    'tab3': tab3,
    'tab4': tab4,
    'tab5': tab5,
    'tab6': tab6,
    'tab7': tab7,
    'tab8': tab8,
    'tab9': tab9,
    'day': day.millisecondsSinceEpoch,
  };
}