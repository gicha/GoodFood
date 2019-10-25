import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:goodfood/models/models.dart';

part 'store.g.dart';

abstract class Store implements Built<Store, StoreBuilder> {
  Store._();

  factory Store([updates(StoreBuilder b)]) = _$Store;

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

  static Serializer<Store> get serializer => _$storeSerializer;
}
