// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_preview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompanyPreviewModel _$CompanyPreviewModelFromJson(Map<String, dynamic> json) {
  return _CompanyOverviewModel.fromJson(json);
}

/// @nodoc
mixin _$CompanyPreviewModel {
  String? get symbol => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get stockExchange => throw _privateConstructorUsedError;
  String? get exchangeShortName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyPreviewModelCopyWith<CompanyPreviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyPreviewModelCopyWith<$Res> {
  factory $CompanyPreviewModelCopyWith(
          CompanyPreviewModel value, $Res Function(CompanyPreviewModel) then) =
      _$CompanyPreviewModelCopyWithImpl<$Res, CompanyPreviewModel>;
  @useResult
  $Res call(
      {String? symbol,
      String? name,
      String? currency,
      String? stockExchange,
      String? exchangeShortName});
}

/// @nodoc
class _$CompanyPreviewModelCopyWithImpl<$Res, $Val extends CompanyPreviewModel>
    implements $CompanyPreviewModelCopyWith<$Res> {
  _$CompanyPreviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = freezed,
    Object? name = freezed,
    Object? currency = freezed,
    Object? stockExchange = freezed,
    Object? exchangeShortName = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      stockExchange: freezed == stockExchange
          ? _value.stockExchange
          : stockExchange // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeShortName: freezed == exchangeShortName
          ? _value.exchangeShortName
          : exchangeShortName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyOverviewModelImplCopyWith<$Res>
    implements $CompanyPreviewModelCopyWith<$Res> {
  factory _$$CompanyOverviewModelImplCopyWith(_$CompanyOverviewModelImpl value,
          $Res Function(_$CompanyOverviewModelImpl) then) =
      __$$CompanyOverviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? symbol,
      String? name,
      String? currency,
      String? stockExchange,
      String? exchangeShortName});
}

/// @nodoc
class __$$CompanyOverviewModelImplCopyWithImpl<$Res>
    extends _$CompanyPreviewModelCopyWithImpl<$Res, _$CompanyOverviewModelImpl>
    implements _$$CompanyOverviewModelImplCopyWith<$Res> {
  __$$CompanyOverviewModelImplCopyWithImpl(_$CompanyOverviewModelImpl _value,
      $Res Function(_$CompanyOverviewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = freezed,
    Object? name = freezed,
    Object? currency = freezed,
    Object? stockExchange = freezed,
    Object? exchangeShortName = freezed,
  }) {
    return _then(_$CompanyOverviewModelImpl(
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      stockExchange: freezed == stockExchange
          ? _value.stockExchange
          : stockExchange // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeShortName: freezed == exchangeShortName
          ? _value.exchangeShortName
          : exchangeShortName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyOverviewModelImpl implements _CompanyOverviewModel {
  const _$CompanyOverviewModelImpl(
      {required this.symbol,
      required this.name,
      required this.currency,
      required this.stockExchange,
      required this.exchangeShortName});

  factory _$CompanyOverviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyOverviewModelImplFromJson(json);

  @override
  final String? symbol;
  @override
  final String? name;
  @override
  final String? currency;
  @override
  final String? stockExchange;
  @override
  final String? exchangeShortName;

  @override
  String toString() {
    return 'CompanyPreviewModel(symbol: $symbol, name: $name, currency: $currency, stockExchange: $stockExchange, exchangeShortName: $exchangeShortName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyOverviewModelImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.stockExchange, stockExchange) ||
                other.stockExchange == stockExchange) &&
            (identical(other.exchangeShortName, exchangeShortName) ||
                other.exchangeShortName == exchangeShortName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, symbol, name, currency, stockExchange, exchangeShortName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyOverviewModelImplCopyWith<_$CompanyOverviewModelImpl>
      get copyWith =>
          __$$CompanyOverviewModelImplCopyWithImpl<_$CompanyOverviewModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyOverviewModelImplToJson(
      this,
    );
  }
}

abstract class _CompanyOverviewModel implements CompanyPreviewModel {
  const factory _CompanyOverviewModel(
      {required final String? symbol,
      required final String? name,
      required final String? currency,
      required final String? stockExchange,
      required final String? exchangeShortName}) = _$CompanyOverviewModelImpl;

  factory _CompanyOverviewModel.fromJson(Map<String, dynamic> json) =
      _$CompanyOverviewModelImpl.fromJson;

  @override
  String? get symbol;
  @override
  String? get name;
  @override
  String? get currency;
  @override
  String? get stockExchange;
  @override
  String? get exchangeShortName;
  @override
  @JsonKey(ignore: true)
  _$$CompanyOverviewModelImplCopyWith<_$CompanyOverviewModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
