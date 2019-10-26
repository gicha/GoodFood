// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Shop> _$shopSerializer = new _$ShopSerializer();

class _$ShopSerializer implements StructuredSerializer<Shop> {
  @override
  final Iterable<Type> types = const [Shop, _$Shop];
  @override
  final String wireName = 'Shop';

  @override
  Iterable<Object> serialize(Serializers serializers, Shop object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(Address)));
    }
    if (object.products != null) {
      result
        ..add('products')
        ..add(serializers.serialize(object.products,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Product)])));
    }
    if (object.phone != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(object.phone,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Shop deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ShopBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address.replace(serializers.deserialize(value,
              specifiedType: const FullType(Address)) as Address);
          break;
        case 'products':
          result.products.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Product)]))
              as BuiltList<dynamic>);
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Shop extends Shop {
  @override
  final String id;
  @override
  final String name;
  @override
  final Address address;
  @override
  final BuiltList<Product> products;
  @override
  final String phone;

  factory _$Shop([void Function(ShopBuilder) updates]) =>
      (new ShopBuilder()..update(updates)).build();

  _$Shop._({this.id, this.name, this.address, this.products, this.phone})
      : super._();

  @override
  Shop rebuild(void Function(ShopBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShopBuilder toBuilder() => new ShopBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Shop &&
        id == other.id &&
        name == other.name &&
        address == other.address &&
        products == other.products &&
        phone == other.phone;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), name.hashCode), address.hashCode),
            products.hashCode),
        phone.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Shop')
          ..add('id', id)
          ..add('name', name)
          ..add('address', address)
          ..add('products', products)
          ..add('phone', phone))
        .toString();
  }
}

class ShopBuilder implements Builder<Shop, ShopBuilder> {
  _$Shop _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  AddressBuilder _address;
  AddressBuilder get address => _$this._address ??= new AddressBuilder();
  set address(AddressBuilder address) => _$this._address = address;

  ListBuilder<Product> _products;
  ListBuilder<Product> get products =>
      _$this._products ??= new ListBuilder<Product>();
  set products(ListBuilder<Product> products) => _$this._products = products;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  ShopBuilder();

  ShopBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _address = _$v.address?.toBuilder();
      _products = _$v.products?.toBuilder();
      _phone = _$v.phone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Shop other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Shop;
  }

  @override
  void update(void Function(ShopBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Shop build() {
    _$Shop _$result;
    try {
      _$result = _$v ??
          new _$Shop._(
              id: id,
              name: name,
              address: _address?.build(),
              products: _products?.build(),
              phone: phone);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'address';
        _address?.build();
        _$failedField = 'products';
        _products?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Shop', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
