class Article {
  final int id;
  final String title;
  final String price;
  final String category;
  final String description;
  final String image;
  bool _isFavorite = false;
  bool _inCart = false;

  Article({required this.id, required this.title, required this.price, required this.category,  required this.description, 
    required this.image, required bool isFavorite, required bool inCart, })  : _isFavorite = isFavorite, _inCart = inCart;

  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
      id: jsonData['id'], 
      title: jsonData['title'], 
      price: jsonData['price'].toString(), 
      category: jsonData['category'], 
      description: jsonData['description'], 
      image: jsonData['image'], 
      isFavorite: false, 
      inCart: false
    );
  }

  bool get isFavorite => _isFavorite;
  bool get inCart => _inCart;

  set isFavorite(bool newValue) {
    _isFavorite = newValue;
  }

  set inCart(bool newValue) {
    _inCart = newValue;
  }
}
