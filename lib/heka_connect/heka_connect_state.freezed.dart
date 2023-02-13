// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heka_connect_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HekaConnectState {
  bool get isLoading => throw _privateConstructorUsedError;
  Map<String, HekaPlatformState> get platformStates =>
      throw _privateConstructorUsedError;
  String? get paymentPlan => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HekaConnectStateCopyWith<HekaConnectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HekaConnectStateCopyWith<$Res> {
  factory $HekaConnectStateCopyWith(
          HekaConnectState value, $Res Function(HekaConnectState) then) =
      _$HekaConnectStateCopyWithImpl<$Res, HekaConnectState>;
  @useResult
  $Res call(
      {bool isLoading,
      Map<String, HekaPlatformState> platformStates,
      String? paymentPlan});
}

/// @nodoc
class _$HekaConnectStateCopyWithImpl<$Res, $Val extends HekaConnectState>
    implements $HekaConnectStateCopyWith<$Res> {
  _$HekaConnectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? platformStates = null,
    Object? paymentPlan = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      platformStates: null == platformStates
          ? _value.platformStates
          : platformStates // ignore: cast_nullable_to_non_nullable
              as Map<String, HekaPlatformState>,
      paymentPlan: freezed == paymentPlan
          ? _value.paymentPlan
          : paymentPlan // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HekaConnectStateCopyWith<$Res>
    implements $HekaConnectStateCopyWith<$Res> {
  factory _$$_HekaConnectStateCopyWith(
          _$_HekaConnectState value, $Res Function(_$_HekaConnectState) then) =
      __$$_HekaConnectStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Map<String, HekaPlatformState> platformStates,
      String? paymentPlan});
}

/// @nodoc
class __$$_HekaConnectStateCopyWithImpl<$Res>
    extends _$HekaConnectStateCopyWithImpl<$Res, _$_HekaConnectState>
    implements _$$_HekaConnectStateCopyWith<$Res> {
  __$$_HekaConnectStateCopyWithImpl(
      _$_HekaConnectState _value, $Res Function(_$_HekaConnectState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? platformStates = null,
    Object? paymentPlan = freezed,
  }) {
    return _then(_$_HekaConnectState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      platformStates: null == platformStates
          ? _value._platformStates
          : platformStates // ignore: cast_nullable_to_non_nullable
              as Map<String, HekaPlatformState>,
      paymentPlan: freezed == paymentPlan
          ? _value.paymentPlan
          : paymentPlan // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_HekaConnectState implements _HekaConnectState {
  const _$_HekaConnectState(
      {required this.isLoading,
      required final Map<String, HekaPlatformState> platformStates,
      required this.paymentPlan})
      : _platformStates = platformStates;

  @override
  final bool isLoading;
  final Map<String, HekaPlatformState> _platformStates;
  @override
  Map<String, HekaPlatformState> get platformStates {
    if (_platformStates is EqualUnmodifiableMapView) return _platformStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_platformStates);
  }

  @override
  final String? paymentPlan;

  @override
  String toString() {
    return 'HekaConnectState(isLoading: $isLoading, platformStates: $platformStates, paymentPlan: $paymentPlan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HekaConnectState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._platformStates, _platformStates) &&
            (identical(other.paymentPlan, paymentPlan) ||
                other.paymentPlan == paymentPlan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_platformStates), paymentPlan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HekaConnectStateCopyWith<_$_HekaConnectState> get copyWith =>
      __$$_HekaConnectStateCopyWithImpl<_$_HekaConnectState>(this, _$identity);
}

abstract class _HekaConnectState implements HekaConnectState {
  const factory _HekaConnectState(
      {required final bool isLoading,
      required final Map<String, HekaPlatformState> platformStates,
      required final String? paymentPlan}) = _$_HekaConnectState;

  @override
  bool get isLoading;
  @override
  Map<String, HekaPlatformState> get platformStates;
  @override
  String? get paymentPlan;
  @override
  @JsonKey(ignore: true)
  _$$_HekaConnectStateCopyWith<_$_HekaConnectState> get copyWith =>
      throw _privateConstructorUsedError;
}
