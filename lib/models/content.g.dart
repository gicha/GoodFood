// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Content> _$contentSerializer = new _$ContentSerializer();

class _$ContentSerializer implements StructuredSerializer<Content> {
  @override
  final Iterable<Type> types = const [Content, _$Content];
  @override
  final String wireName = 'Content';

  @override
  Iterable<Object> serialize(Serializers serializers, Content object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.product != null) {
      result
        ..add('product')
        ..add(serializers.serialize(object.product,
            specifiedType: const FullType(Product)));
    }
    if (object.count != null) {
      result
        ..add('count')
        ..add(serializers.serialize(object.count,
            specifiedType: const FullType(int)));
    }
    if (object.store != null) {
      result
        ..add('store')
        ..add(serializers.serialize(object.store,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Content deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'product':
          result.product.replace(serializers.deserialize(value,
              specifiedType: const FullType(Product)) as Product);
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'store':
          result.store = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Content extends Content {
  @override
  final Product product;
  @override
  final int count;
  @override
  final String store;

  factory _$Content([void Function(ContentBuilder) updates]) =>
      (new ContentBuilder()..update(updates)).build();

  _$Content._({this.product, this.count, this.store}) : super._();

  @override
  Content rebuild(void Function(ContentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentBuilder toBuilder() => new ContentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Content &&
        product == other.product &&
        count == other.count &&
        store == other.store;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, product.hashCode), count.hashCode), store.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Content')
          ..add('product', product)
          ..add('count', count)
          ..add('store', store))
        .toString();
  }
}

class ContentBuilder implements Builder<Content, ContentBuilder> {
  _$Content _$v;

  ProductBuilder _product;
  ProductBuilder get product => _$this._product ??= new ProductBuilder();
  set product(ProductBuilder product) => _$this._product = product;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  String _store;
  String get store => _$this._store;
  set store(String store) => _$this._store = store;

  ContentBuilder();

  ContentBuilder get _$this {
    if (_$v != null) {
      _product = _$v.product?.toBuilder();
      _count = _$v.count;
      _store = _$v.store;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Content other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Content;
  }

  @override
  void update(void Function(ContentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Content build() {
    _$Content _$result;
    try {
      _$result = _$v ??
          new _$Content._(
              product: _product?.build(), count: count, store: store);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'product';
        _product?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Content', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
