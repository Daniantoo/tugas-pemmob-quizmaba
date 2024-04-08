//deklarasi class question dengan variabel yang ada di dalamnya
class Question{
  final String id;
  final String title;
  final Map<String, bool> options;
  final String? imagePath;

  //deklarasi kebutuhan class question
  Question({
    required this.id,
    required this.title,
    required this.options,
    this.imagePath
});

  //return question
  @override
  String toString() {
    return 'Question(id: $id,title: $title, options: $options, imagePath: $imagePath)';
  }

}