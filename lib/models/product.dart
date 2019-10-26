import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product.g.dart';

abstract class Product implements Built<Product, ProductBuilder> {
  Product._();

  factory Product([updates(ProductBuilder b)]) = _$Product;

  @nullable
  @BuiltValueField(wireName: 'id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'image')
  String get image;

  @nullable
  @BuiltValueField(wireName: 'date')
  DateTime get date;

  @nullable
  @BuiltValueField(wireName: 'count')
  double get count;

  static Serializer<Product> get serializer => _$productSerializer;
}
