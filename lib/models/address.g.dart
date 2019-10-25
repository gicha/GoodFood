// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Address> _$addressSerializer = new _$AddressSerializer();

class _$AddressSerializer implements StructuredSerializer<Address> {
  @override
  final Iterable<Type> types = const [Address, _$Address];
  @override
  final String wireName = 'Address';

  @override
  Iterable<Object> serialize(Serializers serializers, Address object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.text != null) {
      result
        ..add('text')
        ..add(serializers.serialize(object.text,
            specifiedType: const FullType(String)));
    }
    if (object.coordinates != null) {
      result
        ..add('coordinates')
        ..add(serializers.serialize(object.coordinates,
            specifiedType: const FullType(LatLng)));
    }
    return result;
  }

  @override
  Address deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddressBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'coordinates':
          result.coordinates = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
      }
    }

    return result.build();
  }
}

class _$Address extends Address {
  @override
  final String text;
  @override
  final LatLng coordinates;

  factory _$Address([void Function(AddressBuilder) updates]) =>
      (new AddressBuilder()..update(updates)).build();

  _$Address._({this.text, this.coordinates}) : super._();

  @override
  Address rebuild(void Function(AddressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressBuilder toBuilder() => new AddressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Address &&
        text == other.text &&
        coordinates == other.coordinates;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, text.hashCode), coordinates.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Address')
          ..add('text', text)
          ..add('coordinates', coordinates))
        .toString();
  }
}

class AddressBuilder implements Builder<Address, AddressBuilder> {
  _$Address _$v;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  LatLng _coordinates;
  LatLng get coordinates => _$this._coordinates;
  set coordinates(LatLng coordinates) => _$this._coordinates = coordinates;

  AddressBuilder();

  AddressBuilder get _$this {
    if (_$v != null) {
      _text = _$v.text;
      _coordinates = _$v.coordinates;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Address other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Address;
  }

  @override
  void update(void Function(AddressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Address build() {
    final _$result =
        _$v ?? new _$Address._(text: text, coordinates: coordinates);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
