
class NewsData {
  final String title;
  final String desc;
  final String date;
  bool isFav = false;
  NewsData({this.desc = '', this.date = '', this.title = ''});
  @override
  bool operator ==(Object other) {
    return (other is NewsData && other.desc == desc && other.title == title && other.date ==date);
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;



}