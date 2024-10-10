// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_conn_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServerConnEvent {
  String get passcodepin => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passcodepin) passcode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String passcodepin)? passcode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passcodepin)? passcode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Passcode value) passcode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Passcode value)? passcode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Passcode value)? passcode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ServerConnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerConnEventCopyWith<ServerConnEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerConnEventCopyWith<$Res> {
  factory $ServerConnEventCopyWith(
          ServerConnEvent value, $Res Function(ServerConnEvent) then) =
      _$ServerConnEventCopyWithImpl<$Res, ServerConnEvent>;
  @useResult
  $Res call({String passcodepin});
}

/// @nodoc
class _$ServerConnEventCopyWithImpl<$Res, $Val extends ServerConnEvent>
    implements $ServerConnEventCopyWith<$Res> {
  _$ServerConnEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerConnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passcodepin = null,
  }) {
    return _then(_value.copyWith(
      passcodepin: null == passcodepin
          ? _value.passcodepin
          : passcodepin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasscodeImplCopyWith<$Res>
    implements $ServerConnEventCopyWith<$Res> {
  factory _$$PasscodeImplCopyWith(
          _$PasscodeImpl value, $Res Function(_$PasscodeImpl) then) =
      __$$PasscodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String passcodepin});
}

/// @nodoc
class __$$PasscodeImplCopyWithImpl<$Res>
    extends _$ServerConnEventCopyWithImpl<$Res, _$PasscodeImpl>
    implements _$$PasscodeImplCopyWith<$Res> {
  __$$PasscodeImplCopyWithImpl(
      _$PasscodeImpl _value, $Res Function(_$PasscodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerConnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passcodepin = null,
  }) {
    return _then(_$PasscodeImpl(
      passcodepin: null == passcodepin
          ? _value.passcodepin
          : passcodepin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasscodeImpl implements Passcode {
  const _$PasscodeImpl({required this.passcodepin});

  @override
  final String passcodepin;

  @override
  String toString() {
    return 'ServerConnEvent.passcode(passcodepin: $passcodepin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasscodeImpl &&
            (identical(other.passcodepin, passcodepin) ||
                other.passcodepin == passcodepin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, passcodepin);

  /// Create a copy of ServerConnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasscodeImplCopyWith<_$PasscodeImpl> get copyWith =>
      __$$PasscodeImplCopyWithImpl<_$PasscodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passcodepin) passcode,
  }) {
    return passcode(passcodepin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String passcodepin)? passcode,
  }) {
    return passcode?.call(passcodepin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passcodepin)? passcode,
    required TResult orElse(),
  }) {
    if (passcode != null) {
      return passcode(passcodepin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Passcode value) passcode,
  }) {
    return passcode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Passcode value)? passcode,
  }) {
    return passcode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Passcode value)? passcode,
    required TResult orElse(),
  }) {
    if (passcode != null) {
      return passcode(this);
    }
    return orElse();
  }
}

abstract class Passcode implements ServerConnEvent {
  const factory Passcode({required final String passcodepin}) = _$PasscodeImpl;

  @override
  String get passcodepin;

  /// Create a copy of ServerConnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasscodeImplCopyWith<_$PasscodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ServerConnState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get passcode => throw _privateConstructorUsedError;
  String? get passcodeErrorMsg => throw _privateConstructorUsedError;

  /// Create a copy of ServerConnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerConnStateCopyWith<ServerConnState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerConnStateCopyWith<$Res> {
  factory $ServerConnStateCopyWith(
          ServerConnState value, $Res Function(ServerConnState) then) =
      _$ServerConnStateCopyWithImpl<$Res, ServerConnState>;
  @useResult
  $Res call({bool isLoading, bool passcode, String? passcodeErrorMsg});
}

/// @nodoc
class _$ServerConnStateCopyWithImpl<$Res, $Val extends ServerConnState>
    implements $ServerConnStateCopyWith<$Res> {
  _$ServerConnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerConnState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? passcode = null,
    Object? passcodeErrorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      passcode: null == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as bool,
      passcodeErrorMsg: freezed == passcodeErrorMsg
          ? _value.passcodeErrorMsg
          : passcodeErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerConnStateImplCopyWith<$Res>
    implements $ServerConnStateCopyWith<$Res> {
  factory _$$ServerConnStateImplCopyWith(_$ServerConnStateImpl value,
          $Res Function(_$ServerConnStateImpl) then) =
      __$$ServerConnStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool passcode, String? passcodeErrorMsg});
}

/// @nodoc
class __$$ServerConnStateImplCopyWithImpl<$Res>
    extends _$ServerConnStateCopyWithImpl<$Res, _$ServerConnStateImpl>
    implements _$$ServerConnStateImplCopyWith<$Res> {
  __$$ServerConnStateImplCopyWithImpl(
      _$ServerConnStateImpl _value, $Res Function(_$ServerConnStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerConnState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? passcode = null,
    Object? passcodeErrorMsg = freezed,
  }) {
    return _then(_$ServerConnStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      passcode: null == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as bool,
      passcodeErrorMsg: freezed == passcodeErrorMsg
          ? _value.passcodeErrorMsg
          : passcodeErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServerConnStateImpl implements _ServerConnState {
  _$ServerConnStateImpl(
      {required this.isLoading, required this.passcode, this.passcodeErrorMsg});

  @override
  final bool isLoading;
  @override
  final bool passcode;
  @override
  final String? passcodeErrorMsg;

  @override
  String toString() {
    return 'ServerConnState(isLoading: $isLoading, passcode: $passcode, passcodeErrorMsg: $passcodeErrorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerConnStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.passcode, passcode) ||
                other.passcode == passcode) &&
            (identical(other.passcodeErrorMsg, passcodeErrorMsg) ||
                other.passcodeErrorMsg == passcodeErrorMsg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, passcode, passcodeErrorMsg);

  /// Create a copy of ServerConnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerConnStateImplCopyWith<_$ServerConnStateImpl> get copyWith =>
      __$$ServerConnStateImplCopyWithImpl<_$ServerConnStateImpl>(
          this, _$identity);
}

abstract class _ServerConnState implements ServerConnState {
  factory _ServerConnState(
      {required final bool isLoading,
      required final bool passcode,
      final String? passcodeErrorMsg}) = _$ServerConnStateImpl;

  @override
  bool get isLoading;
  @override
  bool get passcode;
  @override
  String? get passcodeErrorMsg;

  /// Create a copy of ServerConnState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerConnStateImplCopyWith<_$ServerConnStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
