class Article {
  final int id;
  final String title;
  final String description;
  final String price;
  final String image;
  bool _isFavorite = false;
  bool _inCart = false;

  Article({required this.id, required this.title, required this.description,  required this.price, 
    required this.image, required bool isFavorite, required bool inCart, })  : _isFavorite = isFavorite, _inCart = inCart;

  bool get isFavorite => _isFavorite;
  bool get inCart => _inCart;

  set isFavorite(bool newValue) {
    _isFavorite = newValue;
  }

  set inCart(bool newValue) {
    _inCart = newValue;
  }
}
