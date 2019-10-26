import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:goodfood/models/models.dart';

part 'order.g.dart';

abstract class Order implements Built<Order, OrderBuilder> {
  Order._();

  factory Order([updates(OrderBuilder b)]) = _$Order;

  @nullable
  @BuiltValueField(wireName: 'id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'content')
  Content get content;

  @nullable
  @BuiltValueField(wireName: 'date')
  String get date;

  @nullable
  @BuiltValueField(wireName: 'qr')
  String get qr;

  @nullable
  @BuiltValueField(wireName: 'status')
  bool get status;

  static Serializer<Order> get serializer => _$orderSerializer;
}
