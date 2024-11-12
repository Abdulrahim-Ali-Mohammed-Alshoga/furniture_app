import 'package:furniture_app/core/resources/app_images.dart';
import 'package:furniture_app/core/utils/utils1/extensions.dart';

class FurnitureModel {
  String? _image;
  String? _name;
  double? _price;
  String? _category;
  String? _manufacturer;

  FurnitureModel({
    String? image,
    String? name,
    double? price,
    String? category,
    String? manufacturer,
  }) {
    _image = image;
    _name = name;
    _category = category;
    _price = price;
    _manufacturer = manufacturer;
  }

  factory FurnitureModel.fromMap(Map<String, dynamic> map) {
    return FurnitureModel(
      image: map['lineId'],
      name: map['orderId'],
      category: map['note'],
      manufacturer: map['note'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() => {
        "lineId": _price,
        "t_note": _category,
        "orderId": _name,
        "manufacturer": _manufacturer,
        "image": _image,
      };

  double get price => _price!;

  String get manufacturer => _manufacturer!;

  String get type => _category!;

  String get name => _name.orEmpty;

  String get image => _image.orEmpty;
}

List<FurnitureModel> getFurniture = [
  FurnitureModel(
      image: AppImages.chair1,
      name: 'Pearl Beading Fur Textured ',
      price: 39.00),
  FurnitureModel(
      image: AppImages.chair2, name: 'Trapeziam Arm Chair', price: 29.54),
  FurnitureModel(
      image: AppImages.chair3, name: 'Rotating Lounge Chair', price: 32.8),
  FurnitureModel(
      image: AppImages.chair4, name: 'Corada D3 Lounge Chair', price: 45.90),
];
