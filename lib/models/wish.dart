import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wish.g.dart';

abstract class Wish implements Built<Wish, WishBuilder> {
  Wish._();

  factory Wish([updates(WishBuilder b)]) = _$Wish;

  @nullable
  @BuiltValueField(wireName: 'id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'category')
  String get category;

  @nullable
  @BuiltValueField(wireName: 'date')
  String get date;

  @nullable
  @BuiltValueField(wireName: 'needCount')
  double get needCount;

  @nullable
  @BuiltValueField(wireName: 'existCount')
  double get existCount;

  static Serializer<Wish> get serializer => _$wishSerializer;
}
