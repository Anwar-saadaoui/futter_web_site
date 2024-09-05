class Article {
  late String image, title;
  Article({required this.image, required this.title});

  String  get _image => image;
  set _image(String value){
    image = value;
  }

  String get _title => title;
  set _title(String value){
    title = value;
  }
}