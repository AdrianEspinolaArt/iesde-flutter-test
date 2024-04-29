class CatalogDataModel {
  
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final int quantity;

  CatalogDataModel({
      required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.quantity,
    });
}
extension CatalogDataModelExtension on CatalogDataModel {
  CatalogDataModel copyWith({String? id, String? name, String? description, double? price, String? image, int? quantity}) {
    return CatalogDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
    );
  }
}