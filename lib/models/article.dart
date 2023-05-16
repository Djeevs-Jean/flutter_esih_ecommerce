class Product {
  final int id;
  final String title;
  final String price;
  final String category;
  final String description;
  final String image;

  Product({required this.id, required this.title, required this.price, required this.category,  required this.description, 
    required this.image });

  factory Product.fromJson(Map<String, dynamic> jsonData) {
    return Product(
      id: jsonData['id'], 
      title: jsonData['title'], 
      price: jsonData['price'].toString(), 
      category: jsonData['category'], 
      description: jsonData['description'], 
      image: jsonData['image'], 
    );
  }
}
