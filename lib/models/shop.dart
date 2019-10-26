import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:goodfood/models/models.dart';

part 'shop.g.dart';

abstract class Shop implements Built<Shop, ShopBuilder> {
  Shop._();

  factory Shop([updates(ShopBuilder b)]) = _$Shop;

  @nullable
  @BuiltValueField(wireName: 'id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'address')
  Address get address;

  @nullable
  @BuiltValueField(wireName: 'products')
  BuiltList<Product> get products;

  @nullable
  @BuiltValueField(wireName: 'phone')
  String get phone;

  static Serializer<Shop> get serializer => _$shopSerializer;
}
