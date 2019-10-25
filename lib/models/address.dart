import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'address.g.dart';

abstract class Address implements Built<Address, AddressBuilder> {
  Address._();

  factory Address([updates(AddressBuilder b)]) = _$Address;

  @nullable
  @BuiltValueField(wireName: 'text')
  String get text;

  @nullable
  @BuiltValueField(wireName: 'coordinates')
  LatLng get coordinates;

  static Serializer<Address> get serializer => _$addressSerializer;
}
