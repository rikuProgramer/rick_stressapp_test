class NikkiData{
  String title = '';
  String text = '';
  String text2 = '';
  String emotion = '';
  DateTime date = DateTime.now();
  int stressLevel = 0;

  NikkiData(String title, String text, String text2, String emotion, DateTime date, int stressLevel) {
    this.title = title;
    this.text = text;
    this.text2 = text2;
    this.emotion = emotion;
    this.date = date;
    this.stressLevel = stressLevel;
  }

  NikkiData setNikkiData(String title, String text, String text2, String emotion, DateTime date, int stressLevel) {
    return NikkiData(title, text, text2, emotion, date, stressLevel);
  }

}