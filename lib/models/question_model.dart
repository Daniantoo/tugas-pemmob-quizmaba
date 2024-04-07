class Question{
  final String id;
  final String title;
  final Map<String, bool> options;
  final String? imagePath;

  Question({
    required this.id,
    required this.title,
    required this.options,
    this.imagePath
});

  @override
  String toString() {
    return 'Question(id: $id,title: $title, options: $options, imagePath: $imagePath)';
  }

}