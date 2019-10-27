import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:goodfood/models/models.dart';

part 'content.g.dart';

abstract class Content implements Built<Content, ContentBuilder> {
  Content._();

  factory Content([updates(ContentBuilder b)]) = _$Content;

  @nullable
  @BuiltValueField(wireName: 'product')
  Product get product;

  @nullable
  @BuiltValueField(wireName: 'count')
  int get count;

  @nullable
  @BuiltValueField(wireName: 'store')
  String get store;

  static Serializer<Content> get serializer => _$contentSerializer;
}
