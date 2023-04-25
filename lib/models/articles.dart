class Article {
  final int id;
  final String title;
  final String content;

  Article({required this.id, required this.title, required this.content});

  factory Article.fromJSON(Map<String, dynamic> jsonData) {
    return Article(id: jsonData['id'], title: jsonData['title'], content: jsonData['body']);
  }
}