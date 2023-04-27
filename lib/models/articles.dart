class Article {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  // final String rating;

  Article({required this.id, required this.title, required this.price, required this.description, required this.category, required this.image, });

  factory Article.fromJSON(Map<String, dynamic> jsonData) {
    print("jsonData");
    print(jsonData);
    return Article(id: jsonData['id'], title: jsonData['title'], price: jsonData['price'], description: jsonData['description'], category: jsonData['category'], image: jsonData['image']);
  }
}