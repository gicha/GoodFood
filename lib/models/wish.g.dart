// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Wish> _$wishSerializer = new _$WishSerializer();

class _$WishSerializer implements StructuredSerializer<Wish> {
  @override
  final Iterable<Type> types = const [Wish, _$Wish];
  @override
  final String wireName = 'Wish';

  @override
  Iterable<Object> serialize(Serializers serializers, Wish object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.category != null) {
      result
        ..add('category')
        ..add(serializers.serialize(object.category,
            specifiedType: const FullType(String)));
    }
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(String)));
    }
    if (object.needCount != null) {
      result
        ..add('needCount')
        ..add(serializers.serialize(object.needCount,
            specifiedType: const FullType(double)));
    }
    if (object.existCount != null) {
      result
        ..add('existCount')
        ..add(serializers.serialize(object.existCount,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  Wish deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WishBuilder();

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
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'needCount':
          result.needCount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'existCount':
          result.existCount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$Wish extends Wish {
  @override
  final String id;
  @override
  final String category;
  @override
  final String date;
  @override
  final double needCount;
  @override
  final double existCount;

  factory _$Wish([void Function(WishBuilder) updates]) =>
      (new WishBuilder()..update(updates)).build();

  _$Wish._({this.id, this.category, this.date, this.needCount, this.existCount})
      : super._();

  @override
  Wish rebuild(void Function(WishBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WishBuilder toBuilder() => new WishBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Wish &&
        id == other.id &&
        category == other.category &&
        date == other.date &&
        needCount == other.needCount &&
        existCount == other.existCount;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), category.hashCode), date.hashCode),
            needCount.hashCode),
        existCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Wish')
          ..add('id', id)
          ..add('category', category)
          ..add('date', date)
          ..add('needCount', needCount)
          ..add('existCount', existCount))
        .toString();
  }
}

class WishBuilder implements Builder<Wish, WishBuilder> {
  _$Wish _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  double _needCount;
  double get needCount => _$this._needCount;
  set needCount(double needCount) => _$this._needCount = needCount;

  double _existCount;
  double get existCount => _$this._existCount;
  set existCount(double existCount) => _$this._existCount = existCount;

  WishBuilder();

  WishBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _category = _$v.category;
      _date = _$v.date;
      _needCount = _$v.needCount;
      _existCount = _$v.existCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Wish other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Wish;
  }

  @override
  void update(void Function(WishBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Wish build() {
    final _$result = _$v ??
        new _$Wish._(
            id: id,
            category: category,
            date: date,
            needCount: needCount,
            existCount: existCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
