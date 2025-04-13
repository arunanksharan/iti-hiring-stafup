// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String phoneNumber) sendOTP,
    required TResult Function(String verificationId, String otp) verifyOTP,
    required TResult Function(String phoneNumber) exchangeToken,
    required TResult Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )
    createCompanyEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String phoneNumber)? sendOTP,
    TResult? Function(String verificationId, String otp)? verifyOTP,
    TResult? Function(String phoneNumber)? exchangeToken,
    TResult? Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )?
    createCompanyEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String phoneNumber)? sendOTP,
    TResult Function(String verificationId, String otp)? verifyOTP,
    TResult Function(String phoneNumber)? exchangeToken,
    TResult Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )?
    createCompanyEvent,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SendOTP value) sendOTP,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(_ExchangeToken value) exchangeToken,
    required TResult Function(_CreateCompanyEvent value) createCompanyEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SendOTP value)? sendOTP,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(_ExchangeToken value)? exchangeToken,
    TResult? Function(_CreateCompanyEvent value)? createCompanyEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SendOTP value)? sendOTP,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(_ExchangeToken value)? exchangeToken,
    TResult Function(_CreateCompanyEvent value)? createCompanyEvent,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'AuthEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String phoneNumber) sendOTP,
    required TResult Function(String verificationId, String otp) verifyOTP,
    required TResult Function(String phoneNumber) exchangeToken,
    required TResult Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )
    createCompanyEvent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String phoneNumber)? sendOTP,
    TResult? Function(String verificationId, String otp)? verifyOTP,
    TResult? Function(String phoneNumber)? exchangeToken,
    TResult? Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )?
    createCompanyEvent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String phoneNumber)? sendOTP,
    TResult Function(String verificationId, String otp)? verifyOTP,
    TResult Function(String phoneNumber)? exchangeToken,
    TResult Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )?
    createCompanyEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SendOTP value) sendOTP,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(_ExchangeToken value) exchangeToken,
    required TResult Function(_CreateCompanyEvent value) createCompanyEvent,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SendOTP value)? sendOTP,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(_ExchangeToken value)? exchangeToken,
    TResult? Function(_CreateCompanyEvent value)? createCompanyEvent,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SendOTP value)? sendOTP,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(_ExchangeToken value)? exchangeToken,
    TResult Function(_CreateCompanyEvent value)? createCompanyEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AuthEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SendOTPImplCopyWith<$Res> {
  factory _$$SendOTPImplCopyWith(
    _$SendOTPImpl value,
    $Res Function(_$SendOTPImpl) then,
  ) = __$$SendOTPImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$SendOTPImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SendOTPImpl>
    implements _$$SendOTPImplCopyWith<$Res> {
  __$$SendOTPImplCopyWithImpl(
    _$SendOTPImpl _value,
    $Res Function(_$SendOTPImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phoneNumber = null}) {
    return _then(
      _$SendOTPImpl(
        phoneNumber:
            null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SendOTPImpl implements SendOTP {
  const _$SendOTPImpl({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthEvent.sendOTP(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOTPImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOTPImplCopyWith<_$SendOTPImpl> get copyWith =>
      __$$SendOTPImplCopyWithImpl<_$SendOTPImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String phoneNumber) sendOTP,
    required TResult Function(String verificationId, String otp) verifyOTP,
    required TResult Function(String phoneNumber) exchangeToken,
    required TResult Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )
    createCompanyEvent,
  }) {
    return sendOTP(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String phoneNumber)? sendOTP,
    TResult? Function(String verificationId, String otp)? verifyOTP,
    TResult? Function(String phoneNumber)? exchangeToken,
    TResult? Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )?
    createCompanyEvent,
  }) {
    return sendOTP?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String phoneNumber)? sendOTP,
    TResult Function(String verificationId, String otp)? verifyOTP,
    TResult Function(String phoneNumber)? exchangeToken,
    TResult Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )?
    createCompanyEvent,
    required TResult orElse(),
  }) {
    if (sendOTP != null) {
      return sendOTP(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SendOTP value) sendOTP,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(_ExchangeToken value) exchangeToken,
    required TResult Function(_CreateCompanyEvent value) createCompanyEvent,
  }) {
    return sendOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SendOTP value)? sendOTP,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(_ExchangeToken value)? exchangeToken,
    TResult? Function(_CreateCompanyEvent value)? createCompanyEvent,
  }) {
    return sendOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SendOTP value)? sendOTP,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(_ExchangeToken value)? exchangeToken,
    TResult Function(_CreateCompanyEvent value)? createCompanyEvent,
    required TResult orElse(),
  }) {
    if (sendOTP != null) {
      return sendOTP(this);
    }
    return orElse();
  }
}

abstract class SendOTP implements AuthEvent {
  const factory SendOTP({required final String phoneNumber}) = _$SendOTPImpl;

  String get phoneNumber;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOTPImplCopyWith<_$SendOTPImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOTPImplCopyWith<$Res> {
  factory _$$VerifyOTPImplCopyWith(
    _$VerifyOTPImpl value,
    $Res Function(_$VerifyOTPImpl) then,
  ) = __$$VerifyOTPImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId, String otp});
}

/// @nodoc
class __$$VerifyOTPImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerifyOTPImpl>
    implements _$$VerifyOTPImplCopyWith<$Res> {
  __$$VerifyOTPImplCopyWithImpl(
    _$VerifyOTPImpl _value,
    $Res Function(_$VerifyOTPImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? verificationId = null, Object? otp = null}) {
    return _then(
      _$VerifyOTPImpl(
        verificationId:
            null == verificationId
                ? _value.verificationId
                : verificationId // ignore: cast_nullable_to_non_nullable
                    as String,
        otp:
            null == otp
                ? _value.otp
                : otp // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$VerifyOTPImpl implements VerifyOTP {
  const _$VerifyOTPImpl({required this.verificationId, required this.otp});

  @override
  final String verificationId;
  @override
  final String otp;

  @override
  String toString() {
    return 'AuthEvent.verifyOTP(verificationId: $verificationId, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOTPImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationId, otp);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOTPImplCopyWith<_$VerifyOTPImpl> get copyWith =>
      __$$VerifyOTPImplCopyWithImpl<_$VerifyOTPImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String phoneNumber) sendOTP,
    required TResult Function(String verificationId, String otp) verifyOTP,
    required TResult Function(String phoneNumber) exchangeToken,
    required TResult Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )
    createCompanyEvent,
  }) {
    return verifyOTP(verificationId, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String phoneNumber)? sendOTP,
    TResult? Function(String verificationId, String otp)? verifyOTP,
    TResult? Function(String phoneNumber)? exchangeToken,
    TResult? Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )?
    createCompanyEvent,
  }) {
    return verifyOTP?.call(verificationId, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String phoneNumber)? sendOTP,
    TResult Function(String verificationId, String otp)? verifyOTP,
    TResult Function(String phoneNumber)? exchangeToken,
    TResult Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )?
    createCompanyEvent,
    required TResult orElse(),
  }) {
    if (verifyOTP != null) {
      return verifyOTP(verificationId, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SendOTP value) sendOTP,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(_ExchangeToken value) exchangeToken,
    required TResult Function(_CreateCompanyEvent value) createCompanyEvent,
  }) {
    return verifyOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SendOTP value)? sendOTP,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(_ExchangeToken value)? exchangeToken,
    TResult? Function(_CreateCompanyEvent value)? createCompanyEvent,
  }) {
    return verifyOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SendOTP value)? sendOTP,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(_ExchangeToken value)? exchangeToken,
    TResult Function(_CreateCompanyEvent value)? createCompanyEvent,
    required TResult orElse(),
  }) {
    if (verifyOTP != null) {
      return verifyOTP(this);
    }
    return orElse();
  }
}

abstract class VerifyOTP implements AuthEvent {
  const factory VerifyOTP({
    required final String verificationId,
    required final String otp,
  }) = _$VerifyOTPImpl;

  String get verificationId;
  String get otp;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOTPImplCopyWith<_$VerifyOTPImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExchangeTokenImplCopyWith<$Res> {
  factory _$$ExchangeTokenImplCopyWith(
    _$ExchangeTokenImpl value,
    $Res Function(_$ExchangeTokenImpl) then,
  ) = __$$ExchangeTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$ExchangeTokenImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ExchangeTokenImpl>
    implements _$$ExchangeTokenImplCopyWith<$Res> {
  __$$ExchangeTokenImplCopyWithImpl(
    _$ExchangeTokenImpl _value,
    $Res Function(_$ExchangeTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phoneNumber = null}) {
    return _then(
      _$ExchangeTokenImpl(
        phoneNumber:
            null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ExchangeTokenImpl implements _ExchangeToken {
  const _$ExchangeTokenImpl({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthEvent.exchangeToken(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeTokenImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeTokenImplCopyWith<_$ExchangeTokenImpl> get copyWith =>
      __$$ExchangeTokenImplCopyWithImpl<_$ExchangeTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String phoneNumber) sendOTP,
    required TResult Function(String verificationId, String otp) verifyOTP,
    required TResult Function(String phoneNumber) exchangeToken,
    required TResult Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )
    createCompanyEvent,
  }) {
    return exchangeToken(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String phoneNumber)? sendOTP,
    TResult? Function(String verificationId, String otp)? verifyOTP,
    TResult? Function(String phoneNumber)? exchangeToken,
    TResult? Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )?
    createCompanyEvent,
  }) {
    return exchangeToken?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String phoneNumber)? sendOTP,
    TResult Function(String verificationId, String otp)? verifyOTP,
    TResult Function(String phoneNumber)? exchangeToken,
    TResult Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )?
    createCompanyEvent,
    required TResult orElse(),
  }) {
    if (exchangeToken != null) {
      return exchangeToken(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SendOTP value) sendOTP,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(_ExchangeToken value) exchangeToken,
    required TResult Function(_CreateCompanyEvent value) createCompanyEvent,
  }) {
    return exchangeToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SendOTP value)? sendOTP,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(_ExchangeToken value)? exchangeToken,
    TResult? Function(_CreateCompanyEvent value)? createCompanyEvent,
  }) {
    return exchangeToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SendOTP value)? sendOTP,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(_ExchangeToken value)? exchangeToken,
    TResult Function(_CreateCompanyEvent value)? createCompanyEvent,
    required TResult orElse(),
  }) {
    if (exchangeToken != null) {
      return exchangeToken(this);
    }
    return orElse();
  }
}

abstract class _ExchangeToken implements AuthEvent {
  const factory _ExchangeToken({required final String phoneNumber}) =
      _$ExchangeTokenImpl;

  String get phoneNumber;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExchangeTokenImplCopyWith<_$ExchangeTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateCompanyEventImplCopyWith<$Res> {
  factory _$$CreateCompanyEventImplCopyWith(
    _$CreateCompanyEventImpl value,
    $Res Function(_$CreateCompanyEventImpl) then,
  ) = __$$CreateCompanyEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? name, String gstNumber, String email, String? address});
}

/// @nodoc
class __$$CreateCompanyEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CreateCompanyEventImpl>
    implements _$$CreateCompanyEventImplCopyWith<$Res> {
  __$$CreateCompanyEventImplCopyWithImpl(
    _$CreateCompanyEventImpl _value,
    $Res Function(_$CreateCompanyEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? gstNumber = null,
    Object? email = null,
    Object? address = freezed,
  }) {
    return _then(
      _$CreateCompanyEventImpl(
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        gstNumber:
            null == gstNumber
                ? _value.gstNumber
                : gstNumber // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        address:
            freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$CreateCompanyEventImpl implements _CreateCompanyEvent {
  const _$CreateCompanyEventImpl({
    this.name,
    required this.gstNumber,
    required this.email,
    this.address,
  });

  @override
  final String? name;
  @override
  final String gstNumber;
  @override
  final String email;
  @override
  final String? address;

  @override
  String toString() {
    return 'AuthEvent.createCompanyEvent(name: $name, gstNumber: $gstNumber, email: $email, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCompanyEventImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gstNumber, gstNumber) ||
                other.gstNumber == gstNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, gstNumber, email, address);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCompanyEventImplCopyWith<_$CreateCompanyEventImpl> get copyWith =>
      __$$CreateCompanyEventImplCopyWithImpl<_$CreateCompanyEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String phoneNumber) sendOTP,
    required TResult Function(String verificationId, String otp) verifyOTP,
    required TResult Function(String phoneNumber) exchangeToken,
    required TResult Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )
    createCompanyEvent,
  }) {
    return createCompanyEvent(name, gstNumber, email, address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String phoneNumber)? sendOTP,
    TResult? Function(String verificationId, String otp)? verifyOTP,
    TResult? Function(String phoneNumber)? exchangeToken,
    TResult? Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )?
    createCompanyEvent,
  }) {
    return createCompanyEvent?.call(name, gstNumber, email, address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String phoneNumber)? sendOTP,
    TResult Function(String verificationId, String otp)? verifyOTP,
    TResult Function(String phoneNumber)? exchangeToken,
    TResult Function(
      String? name,
      String gstNumber,
      String email,
      String? address,
    )?
    createCompanyEvent,
    required TResult orElse(),
  }) {
    if (createCompanyEvent != null) {
      return createCompanyEvent(name, gstNumber, email, address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SendOTP value) sendOTP,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(_ExchangeToken value) exchangeToken,
    required TResult Function(_CreateCompanyEvent value) createCompanyEvent,
  }) {
    return createCompanyEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SendOTP value)? sendOTP,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(_ExchangeToken value)? exchangeToken,
    TResult? Function(_CreateCompanyEvent value)? createCompanyEvent,
  }) {
    return createCompanyEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SendOTP value)? sendOTP,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(_ExchangeToken value)? exchangeToken,
    TResult Function(_CreateCompanyEvent value)? createCompanyEvent,
    required TResult orElse(),
  }) {
    if (createCompanyEvent != null) {
      return createCompanyEvent(this);
    }
    return orElse();
  }
}

abstract class _CreateCompanyEvent implements AuthEvent {
  const factory _CreateCompanyEvent({
    final String? name,
    required final String gstNumber,
    required final String email,
    final String? address,
  }) = _$CreateCompanyEventImpl;

  String? get name;
  String get gstNumber;
  String get email;
  String? get address;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCompanyEventImplCopyWith<_$CreateCompanyEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  AuthStateStore get store => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStateStore store) initial,
    required TResult Function(AuthStateStore store) loading,
    required TResult Function(AuthStateStore store) otpSent,
    required TResult Function(AuthStateStore store) otpVerified,
    required TResult Function(AuthStateStore store) exchangeTokenVerified,
    required TResult Function(AuthStateStore store) createCompanySuccess,
    required TResult Function(AuthStateStore store, bool isAccountNotFound)
    error,
    required TResult Function(AuthStateStore store) phoneNumberError,
    required TResult Function(AuthStateStore store) otpVerifiedError,
    required TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )
    createCompanyError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStateStore store)? initial,
    TResult? Function(AuthStateStore store)? loading,
    TResult? Function(AuthStateStore store)? otpSent,
    TResult? Function(AuthStateStore store)? otpVerified,
    TResult? Function(AuthStateStore store)? exchangeTokenVerified,
    TResult? Function(AuthStateStore store)? createCompanySuccess,
    TResult? Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult? Function(AuthStateStore store)? phoneNumberError,
    TResult? Function(AuthStateStore store)? otpVerifiedError,
    TResult? Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStateStore store)? initial,
    TResult Function(AuthStateStore store)? loading,
    TResult Function(AuthStateStore store)? otpSent,
    TResult Function(AuthStateStore store)? otpVerified,
    TResult Function(AuthStateStore store)? exchangeTokenVerified,
    TResult Function(AuthStateStore store)? createCompanySuccess,
    TResult Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult Function(AuthStateStore store)? phoneNumberError,
    TResult Function(AuthStateStore store)? otpVerifiedError,
    TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(OTPSent value) otpSent,
    required TResult Function(OTPVerified value) otpVerified,
    required TResult Function(ExchangeTokenVerified value)
    exchangeTokenVerified,
    required TResult Function(CreateCompanySuccess value) createCompanySuccess,
    required TResult Function(Error value) error,
    required TResult Function(PhoneNumberError value) phoneNumberError,
    required TResult Function(OtpVerifiedError value) otpVerifiedError,
    required TResult Function(CreateCompanyError value) createCompanyError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(OTPSent value)? otpSent,
    TResult? Function(OTPVerified value)? otpVerified,
    TResult? Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult? Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult? Function(Error value)? error,
    TResult? Function(PhoneNumberError value)? phoneNumberError,
    TResult? Function(OtpVerifiedError value)? otpVerifiedError,
    TResult? Function(CreateCompanyError value)? createCompanyError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(OTPSent value)? otpSent,
    TResult Function(OTPVerified value)? otpVerified,
    TResult Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult Function(Error value)? error,
    TResult Function(PhoneNumberError value)? phoneNumberError,
    TResult Function(OtpVerifiedError value)? otpVerifiedError,
    TResult Function(CreateCompanyError value)? createCompanyError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({AuthStateStore store});

  $AuthStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _value.copyWith(
            store:
                null == store
                    ? _value.store
                    : store // ignore: cast_nullable_to_non_nullable
                        as AuthStateStore,
          )
          as $Val,
    );
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthStateStoreCopyWith<$Res> get store {
    return $AuthStateStoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStateStore store});

  @override
  $AuthStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$InitialImpl(
        store:
            null == store
                ? _value.store
                : store // ignore: cast_nullable_to_non_nullable
                    as AuthStateStore,
      ),
    );
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl({required this.store});

  @override
  final AuthStateStore store;

  @override
  String toString() {
    return 'AuthState.initial(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStateStore store) initial,
    required TResult Function(AuthStateStore store) loading,
    required TResult Function(AuthStateStore store) otpSent,
    required TResult Function(AuthStateStore store) otpVerified,
    required TResult Function(AuthStateStore store) exchangeTokenVerified,
    required TResult Function(AuthStateStore store) createCompanySuccess,
    required TResult Function(AuthStateStore store, bool isAccountNotFound)
    error,
    required TResult Function(AuthStateStore store) phoneNumberError,
    required TResult Function(AuthStateStore store) otpVerifiedError,
    required TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )
    createCompanyError,
  }) {
    return initial(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStateStore store)? initial,
    TResult? Function(AuthStateStore store)? loading,
    TResult? Function(AuthStateStore store)? otpSent,
    TResult? Function(AuthStateStore store)? otpVerified,
    TResult? Function(AuthStateStore store)? exchangeTokenVerified,
    TResult? Function(AuthStateStore store)? createCompanySuccess,
    TResult? Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult? Function(AuthStateStore store)? phoneNumberError,
    TResult? Function(AuthStateStore store)? otpVerifiedError,
    TResult? Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
  }) {
    return initial?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStateStore store)? initial,
    TResult Function(AuthStateStore store)? loading,
    TResult Function(AuthStateStore store)? otpSent,
    TResult Function(AuthStateStore store)? otpVerified,
    TResult Function(AuthStateStore store)? exchangeTokenVerified,
    TResult Function(AuthStateStore store)? createCompanySuccess,
    TResult Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult Function(AuthStateStore store)? phoneNumberError,
    TResult Function(AuthStateStore store)? otpVerifiedError,
    TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(OTPSent value) otpSent,
    required TResult Function(OTPVerified value) otpVerified,
    required TResult Function(ExchangeTokenVerified value)
    exchangeTokenVerified,
    required TResult Function(CreateCompanySuccess value) createCompanySuccess,
    required TResult Function(Error value) error,
    required TResult Function(PhoneNumberError value) phoneNumberError,
    required TResult Function(OtpVerifiedError value) otpVerifiedError,
    required TResult Function(CreateCompanyError value) createCompanyError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(OTPSent value)? otpSent,
    TResult? Function(OTPVerified value)? otpVerified,
    TResult? Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult? Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult? Function(Error value)? error,
    TResult? Function(PhoneNumberError value)? phoneNumberError,
    TResult? Function(OtpVerifiedError value)? otpVerifiedError,
    TResult? Function(CreateCompanyError value)? createCompanyError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(OTPSent value)? otpSent,
    TResult Function(OTPVerified value)? otpVerified,
    TResult Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult Function(Error value)? error,
    TResult Function(PhoneNumberError value)? phoneNumberError,
    TResult Function(OtpVerifiedError value)? otpVerifiedError,
    TResult Function(CreateCompanyError value)? createCompanyError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AuthState {
  const factory Initial({required final AuthStateStore store}) = _$InitialImpl;

  @override
  AuthStateStore get store;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStateStore store});

  @override
  $AuthStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$LoadingImpl(
        store:
            null == store
                ? _value.store
                : store // ignore: cast_nullable_to_non_nullable
                    as AuthStateStore,
      ),
    );
  }
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl({required this.store});

  @override
  final AuthStateStore store;

  @override
  String toString() {
    return 'AuthState.loading(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStateStore store) initial,
    required TResult Function(AuthStateStore store) loading,
    required TResult Function(AuthStateStore store) otpSent,
    required TResult Function(AuthStateStore store) otpVerified,
    required TResult Function(AuthStateStore store) exchangeTokenVerified,
    required TResult Function(AuthStateStore store) createCompanySuccess,
    required TResult Function(AuthStateStore store, bool isAccountNotFound)
    error,
    required TResult Function(AuthStateStore store) phoneNumberError,
    required TResult Function(AuthStateStore store) otpVerifiedError,
    required TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )
    createCompanyError,
  }) {
    return loading(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStateStore store)? initial,
    TResult? Function(AuthStateStore store)? loading,
    TResult? Function(AuthStateStore store)? otpSent,
    TResult? Function(AuthStateStore store)? otpVerified,
    TResult? Function(AuthStateStore store)? exchangeTokenVerified,
    TResult? Function(AuthStateStore store)? createCompanySuccess,
    TResult? Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult? Function(AuthStateStore store)? phoneNumberError,
    TResult? Function(AuthStateStore store)? otpVerifiedError,
    TResult? Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
  }) {
    return loading?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStateStore store)? initial,
    TResult Function(AuthStateStore store)? loading,
    TResult Function(AuthStateStore store)? otpSent,
    TResult Function(AuthStateStore store)? otpVerified,
    TResult Function(AuthStateStore store)? exchangeTokenVerified,
    TResult Function(AuthStateStore store)? createCompanySuccess,
    TResult Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult Function(AuthStateStore store)? phoneNumberError,
    TResult Function(AuthStateStore store)? otpVerifiedError,
    TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(OTPSent value) otpSent,
    required TResult Function(OTPVerified value) otpVerified,
    required TResult Function(ExchangeTokenVerified value)
    exchangeTokenVerified,
    required TResult Function(CreateCompanySuccess value) createCompanySuccess,
    required TResult Function(Error value) error,
    required TResult Function(PhoneNumberError value) phoneNumberError,
    required TResult Function(OtpVerifiedError value) otpVerifiedError,
    required TResult Function(CreateCompanyError value) createCompanyError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(OTPSent value)? otpSent,
    TResult? Function(OTPVerified value)? otpVerified,
    TResult? Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult? Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult? Function(Error value)? error,
    TResult? Function(PhoneNumberError value)? phoneNumberError,
    TResult? Function(OtpVerifiedError value)? otpVerifiedError,
    TResult? Function(CreateCompanyError value)? createCompanyError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(OTPSent value)? otpSent,
    TResult Function(OTPVerified value)? otpVerified,
    TResult Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult Function(Error value)? error,
    TResult Function(PhoneNumberError value)? phoneNumberError,
    TResult Function(OtpVerifiedError value)? otpVerifiedError,
    TResult Function(CreateCompanyError value)? createCompanyError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements AuthState {
  const factory Loading({required final AuthStateStore store}) = _$LoadingImpl;

  @override
  AuthStateStore get store;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OTPSentImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$OTPSentImplCopyWith(
    _$OTPSentImpl value,
    $Res Function(_$OTPSentImpl) then,
  ) = __$$OTPSentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStateStore store});

  @override
  $AuthStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$OTPSentImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$OTPSentImpl>
    implements _$$OTPSentImplCopyWith<$Res> {
  __$$OTPSentImplCopyWithImpl(
    _$OTPSentImpl _value,
    $Res Function(_$OTPSentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$OTPSentImpl(
        store:
            null == store
                ? _value.store
                : store // ignore: cast_nullable_to_non_nullable
                    as AuthStateStore,
      ),
    );
  }
}

/// @nodoc

class _$OTPSentImpl implements OTPSent {
  const _$OTPSentImpl({required this.store});

  @override
  final AuthStateStore store;

  @override
  String toString() {
    return 'AuthState.otpSent(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OTPSentImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OTPSentImplCopyWith<_$OTPSentImpl> get copyWith =>
      __$$OTPSentImplCopyWithImpl<_$OTPSentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStateStore store) initial,
    required TResult Function(AuthStateStore store) loading,
    required TResult Function(AuthStateStore store) otpSent,
    required TResult Function(AuthStateStore store) otpVerified,
    required TResult Function(AuthStateStore store) exchangeTokenVerified,
    required TResult Function(AuthStateStore store) createCompanySuccess,
    required TResult Function(AuthStateStore store, bool isAccountNotFound)
    error,
    required TResult Function(AuthStateStore store) phoneNumberError,
    required TResult Function(AuthStateStore store) otpVerifiedError,
    required TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )
    createCompanyError,
  }) {
    return otpSent(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStateStore store)? initial,
    TResult? Function(AuthStateStore store)? loading,
    TResult? Function(AuthStateStore store)? otpSent,
    TResult? Function(AuthStateStore store)? otpVerified,
    TResult? Function(AuthStateStore store)? exchangeTokenVerified,
    TResult? Function(AuthStateStore store)? createCompanySuccess,
    TResult? Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult? Function(AuthStateStore store)? phoneNumberError,
    TResult? Function(AuthStateStore store)? otpVerifiedError,
    TResult? Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
  }) {
    return otpSent?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStateStore store)? initial,
    TResult Function(AuthStateStore store)? loading,
    TResult Function(AuthStateStore store)? otpSent,
    TResult Function(AuthStateStore store)? otpVerified,
    TResult Function(AuthStateStore store)? exchangeTokenVerified,
    TResult Function(AuthStateStore store)? createCompanySuccess,
    TResult Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult Function(AuthStateStore store)? phoneNumberError,
    TResult Function(AuthStateStore store)? otpVerifiedError,
    TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(OTPSent value) otpSent,
    required TResult Function(OTPVerified value) otpVerified,
    required TResult Function(ExchangeTokenVerified value)
    exchangeTokenVerified,
    required TResult Function(CreateCompanySuccess value) createCompanySuccess,
    required TResult Function(Error value) error,
    required TResult Function(PhoneNumberError value) phoneNumberError,
    required TResult Function(OtpVerifiedError value) otpVerifiedError,
    required TResult Function(CreateCompanyError value) createCompanyError,
  }) {
    return otpSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(OTPSent value)? otpSent,
    TResult? Function(OTPVerified value)? otpVerified,
    TResult? Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult? Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult? Function(Error value)? error,
    TResult? Function(PhoneNumberError value)? phoneNumberError,
    TResult? Function(OtpVerifiedError value)? otpVerifiedError,
    TResult? Function(CreateCompanyError value)? createCompanyError,
  }) {
    return otpSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(OTPSent value)? otpSent,
    TResult Function(OTPVerified value)? otpVerified,
    TResult Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult Function(Error value)? error,
    TResult Function(PhoneNumberError value)? phoneNumberError,
    TResult Function(OtpVerifiedError value)? otpVerifiedError,
    TResult Function(CreateCompanyError value)? createCompanyError,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(this);
    }
    return orElse();
  }
}

abstract class OTPSent implements AuthState {
  const factory OTPSent({required final AuthStateStore store}) = _$OTPSentImpl;

  @override
  AuthStateStore get store;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OTPSentImplCopyWith<_$OTPSentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OTPVerifiedImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$OTPVerifiedImplCopyWith(
    _$OTPVerifiedImpl value,
    $Res Function(_$OTPVerifiedImpl) then,
  ) = __$$OTPVerifiedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStateStore store});

  @override
  $AuthStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$OTPVerifiedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$OTPVerifiedImpl>
    implements _$$OTPVerifiedImplCopyWith<$Res> {
  __$$OTPVerifiedImplCopyWithImpl(
    _$OTPVerifiedImpl _value,
    $Res Function(_$OTPVerifiedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$OTPVerifiedImpl(
        store:
            null == store
                ? _value.store
                : store // ignore: cast_nullable_to_non_nullable
                    as AuthStateStore,
      ),
    );
  }
}

/// @nodoc

class _$OTPVerifiedImpl implements OTPVerified {
  const _$OTPVerifiedImpl({required this.store});

  @override
  final AuthStateStore store;

  @override
  String toString() {
    return 'AuthState.otpVerified(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OTPVerifiedImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OTPVerifiedImplCopyWith<_$OTPVerifiedImpl> get copyWith =>
      __$$OTPVerifiedImplCopyWithImpl<_$OTPVerifiedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStateStore store) initial,
    required TResult Function(AuthStateStore store) loading,
    required TResult Function(AuthStateStore store) otpSent,
    required TResult Function(AuthStateStore store) otpVerified,
    required TResult Function(AuthStateStore store) exchangeTokenVerified,
    required TResult Function(AuthStateStore store) createCompanySuccess,
    required TResult Function(AuthStateStore store, bool isAccountNotFound)
    error,
    required TResult Function(AuthStateStore store) phoneNumberError,
    required TResult Function(AuthStateStore store) otpVerifiedError,
    required TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )
    createCompanyError,
  }) {
    return otpVerified(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStateStore store)? initial,
    TResult? Function(AuthStateStore store)? loading,
    TResult? Function(AuthStateStore store)? otpSent,
    TResult? Function(AuthStateStore store)? otpVerified,
    TResult? Function(AuthStateStore store)? exchangeTokenVerified,
    TResult? Function(AuthStateStore store)? createCompanySuccess,
    TResult? Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult? Function(AuthStateStore store)? phoneNumberError,
    TResult? Function(AuthStateStore store)? otpVerifiedError,
    TResult? Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
  }) {
    return otpVerified?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStateStore store)? initial,
    TResult Function(AuthStateStore store)? loading,
    TResult Function(AuthStateStore store)? otpSent,
    TResult Function(AuthStateStore store)? otpVerified,
    TResult Function(AuthStateStore store)? exchangeTokenVerified,
    TResult Function(AuthStateStore store)? createCompanySuccess,
    TResult Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult Function(AuthStateStore store)? phoneNumberError,
    TResult Function(AuthStateStore store)? otpVerifiedError,
    TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
    required TResult orElse(),
  }) {
    if (otpVerified != null) {
      return otpVerified(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(OTPSent value) otpSent,
    required TResult Function(OTPVerified value) otpVerified,
    required TResult Function(ExchangeTokenVerified value)
    exchangeTokenVerified,
    required TResult Function(CreateCompanySuccess value) createCompanySuccess,
    required TResult Function(Error value) error,
    required TResult Function(PhoneNumberError value) phoneNumberError,
    required TResult Function(OtpVerifiedError value) otpVerifiedError,
    required TResult Function(CreateCompanyError value) createCompanyError,
  }) {
    return otpVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(OTPSent value)? otpSent,
    TResult? Function(OTPVerified value)? otpVerified,
    TResult? Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult? Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult? Function(Error value)? error,
    TResult? Function(PhoneNumberError value)? phoneNumberError,
    TResult? Function(OtpVerifiedError value)? otpVerifiedError,
    TResult? Function(CreateCompanyError value)? createCompanyError,
  }) {
    return otpVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(OTPSent value)? otpSent,
    TResult Function(OTPVerified value)? otpVerified,
    TResult Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult Function(Error value)? error,
    TResult Function(PhoneNumberError value)? phoneNumberError,
    TResult Function(OtpVerifiedError value)? otpVerifiedError,
    TResult Function(CreateCompanyError value)? createCompanyError,
    required TResult orElse(),
  }) {
    if (otpVerified != null) {
      return otpVerified(this);
    }
    return orElse();
  }
}

abstract class OTPVerified implements AuthState {
  const factory OTPVerified({required final AuthStateStore store}) =
      _$OTPVerifiedImpl;

  @override
  AuthStateStore get store;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OTPVerifiedImplCopyWith<_$OTPVerifiedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExchangeTokenVerifiedImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$ExchangeTokenVerifiedImplCopyWith(
    _$ExchangeTokenVerifiedImpl value,
    $Res Function(_$ExchangeTokenVerifiedImpl) then,
  ) = __$$ExchangeTokenVerifiedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStateStore store});

  @override
  $AuthStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$ExchangeTokenVerifiedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ExchangeTokenVerifiedImpl>
    implements _$$ExchangeTokenVerifiedImplCopyWith<$Res> {
  __$$ExchangeTokenVerifiedImplCopyWithImpl(
    _$ExchangeTokenVerifiedImpl _value,
    $Res Function(_$ExchangeTokenVerifiedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$ExchangeTokenVerifiedImpl(
        store:
            null == store
                ? _value.store
                : store // ignore: cast_nullable_to_non_nullable
                    as AuthStateStore,
      ),
    );
  }
}

/// @nodoc

class _$ExchangeTokenVerifiedImpl implements ExchangeTokenVerified {
  const _$ExchangeTokenVerifiedImpl({required this.store});

  @override
  final AuthStateStore store;

  @override
  String toString() {
    return 'AuthState.exchangeTokenVerified(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeTokenVerifiedImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeTokenVerifiedImplCopyWith<_$ExchangeTokenVerifiedImpl>
  get copyWith =>
      __$$ExchangeTokenVerifiedImplCopyWithImpl<_$ExchangeTokenVerifiedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStateStore store) initial,
    required TResult Function(AuthStateStore store) loading,
    required TResult Function(AuthStateStore store) otpSent,
    required TResult Function(AuthStateStore store) otpVerified,
    required TResult Function(AuthStateStore store) exchangeTokenVerified,
    required TResult Function(AuthStateStore store) createCompanySuccess,
    required TResult Function(AuthStateStore store, bool isAccountNotFound)
    error,
    required TResult Function(AuthStateStore store) phoneNumberError,
    required TResult Function(AuthStateStore store) otpVerifiedError,
    required TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )
    createCompanyError,
  }) {
    return exchangeTokenVerified(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStateStore store)? initial,
    TResult? Function(AuthStateStore store)? loading,
    TResult? Function(AuthStateStore store)? otpSent,
    TResult? Function(AuthStateStore store)? otpVerified,
    TResult? Function(AuthStateStore store)? exchangeTokenVerified,
    TResult? Function(AuthStateStore store)? createCompanySuccess,
    TResult? Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult? Function(AuthStateStore store)? phoneNumberError,
    TResult? Function(AuthStateStore store)? otpVerifiedError,
    TResult? Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
  }) {
    return exchangeTokenVerified?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStateStore store)? initial,
    TResult Function(AuthStateStore store)? loading,
    TResult Function(AuthStateStore store)? otpSent,
    TResult Function(AuthStateStore store)? otpVerified,
    TResult Function(AuthStateStore store)? exchangeTokenVerified,
    TResult Function(AuthStateStore store)? createCompanySuccess,
    TResult Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult Function(AuthStateStore store)? phoneNumberError,
    TResult Function(AuthStateStore store)? otpVerifiedError,
    TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
    required TResult orElse(),
  }) {
    if (exchangeTokenVerified != null) {
      return exchangeTokenVerified(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(OTPSent value) otpSent,
    required TResult Function(OTPVerified value) otpVerified,
    required TResult Function(ExchangeTokenVerified value)
    exchangeTokenVerified,
    required TResult Function(CreateCompanySuccess value) createCompanySuccess,
    required TResult Function(Error value) error,
    required TResult Function(PhoneNumberError value) phoneNumberError,
    required TResult Function(OtpVerifiedError value) otpVerifiedError,
    required TResult Function(CreateCompanyError value) createCompanyError,
  }) {
    return exchangeTokenVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(OTPSent value)? otpSent,
    TResult? Function(OTPVerified value)? otpVerified,
    TResult? Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult? Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult? Function(Error value)? error,
    TResult? Function(PhoneNumberError value)? phoneNumberError,
    TResult? Function(OtpVerifiedError value)? otpVerifiedError,
    TResult? Function(CreateCompanyError value)? createCompanyError,
  }) {
    return exchangeTokenVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(OTPSent value)? otpSent,
    TResult Function(OTPVerified value)? otpVerified,
    TResult Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult Function(Error value)? error,
    TResult Function(PhoneNumberError value)? phoneNumberError,
    TResult Function(OtpVerifiedError value)? otpVerifiedError,
    TResult Function(CreateCompanyError value)? createCompanyError,
    required TResult orElse(),
  }) {
    if (exchangeTokenVerified != null) {
      return exchangeTokenVerified(this);
    }
    return orElse();
  }
}

abstract class ExchangeTokenVerified implements AuthState {
  const factory ExchangeTokenVerified({required final AuthStateStore store}) =
      _$ExchangeTokenVerifiedImpl;

  @override
  AuthStateStore get store;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExchangeTokenVerifiedImplCopyWith<_$ExchangeTokenVerifiedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateCompanySuccessImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$CreateCompanySuccessImplCopyWith(
    _$CreateCompanySuccessImpl value,
    $Res Function(_$CreateCompanySuccessImpl) then,
  ) = __$$CreateCompanySuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStateStore store});

  @override
  $AuthStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$CreateCompanySuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$CreateCompanySuccessImpl>
    implements _$$CreateCompanySuccessImplCopyWith<$Res> {
  __$$CreateCompanySuccessImplCopyWithImpl(
    _$CreateCompanySuccessImpl _value,
    $Res Function(_$CreateCompanySuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$CreateCompanySuccessImpl(
        store:
            null == store
                ? _value.store
                : store // ignore: cast_nullable_to_non_nullable
                    as AuthStateStore,
      ),
    );
  }
}

/// @nodoc

class _$CreateCompanySuccessImpl implements CreateCompanySuccess {
  const _$CreateCompanySuccessImpl({required this.store});

  @override
  final AuthStateStore store;

  @override
  String toString() {
    return 'AuthState.createCompanySuccess(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCompanySuccessImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCompanySuccessImplCopyWith<_$CreateCompanySuccessImpl>
  get copyWith =>
      __$$CreateCompanySuccessImplCopyWithImpl<_$CreateCompanySuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStateStore store) initial,
    required TResult Function(AuthStateStore store) loading,
    required TResult Function(AuthStateStore store) otpSent,
    required TResult Function(AuthStateStore store) otpVerified,
    required TResult Function(AuthStateStore store) exchangeTokenVerified,
    required TResult Function(AuthStateStore store) createCompanySuccess,
    required TResult Function(AuthStateStore store, bool isAccountNotFound)
    error,
    required TResult Function(AuthStateStore store) phoneNumberError,
    required TResult Function(AuthStateStore store) otpVerifiedError,
    required TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )
    createCompanyError,
  }) {
    return createCompanySuccess(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStateStore store)? initial,
    TResult? Function(AuthStateStore store)? loading,
    TResult? Function(AuthStateStore store)? otpSent,
    TResult? Function(AuthStateStore store)? otpVerified,
    TResult? Function(AuthStateStore store)? exchangeTokenVerified,
    TResult? Function(AuthStateStore store)? createCompanySuccess,
    TResult? Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult? Function(AuthStateStore store)? phoneNumberError,
    TResult? Function(AuthStateStore store)? otpVerifiedError,
    TResult? Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
  }) {
    return createCompanySuccess?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStateStore store)? initial,
    TResult Function(AuthStateStore store)? loading,
    TResult Function(AuthStateStore store)? otpSent,
    TResult Function(AuthStateStore store)? otpVerified,
    TResult Function(AuthStateStore store)? exchangeTokenVerified,
    TResult Function(AuthStateStore store)? createCompanySuccess,
    TResult Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult Function(AuthStateStore store)? phoneNumberError,
    TResult Function(AuthStateStore store)? otpVerifiedError,
    TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
    required TResult orElse(),
  }) {
    if (createCompanySuccess != null) {
      return createCompanySuccess(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(OTPSent value) otpSent,
    required TResult Function(OTPVerified value) otpVerified,
    required TResult Function(ExchangeTokenVerified value)
    exchangeTokenVerified,
    required TResult Function(CreateCompanySuccess value) createCompanySuccess,
    required TResult Function(Error value) error,
    required TResult Function(PhoneNumberError value) phoneNumberError,
    required TResult Function(OtpVerifiedError value) otpVerifiedError,
    required TResult Function(CreateCompanyError value) createCompanyError,
  }) {
    return createCompanySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(OTPSent value)? otpSent,
    TResult? Function(OTPVerified value)? otpVerified,
    TResult? Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult? Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult? Function(Error value)? error,
    TResult? Function(PhoneNumberError value)? phoneNumberError,
    TResult? Function(OtpVerifiedError value)? otpVerifiedError,
    TResult? Function(CreateCompanyError value)? createCompanyError,
  }) {
    return createCompanySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(OTPSent value)? otpSent,
    TResult Function(OTPVerified value)? otpVerified,
    TResult Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult Function(Error value)? error,
    TResult Function(PhoneNumberError value)? phoneNumberError,
    TResult Function(OtpVerifiedError value)? otpVerifiedError,
    TResult Function(CreateCompanyError value)? createCompanyError,
    required TResult orElse(),
  }) {
    if (createCompanySuccess != null) {
      return createCompanySuccess(this);
    }
    return orElse();
  }
}

abstract class CreateCompanySuccess implements AuthState {
  const factory CreateCompanySuccess({required final AuthStateStore store}) =
      _$CreateCompanySuccessImpl;

  @override
  AuthStateStore get store;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCompanySuccessImplCopyWith<_$CreateCompanySuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStateStore store, bool isAccountNotFound});

  @override
  $AuthStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null, Object? isAccountNotFound = null}) {
    return _then(
      _$ErrorImpl(
        store:
            null == store
                ? _value.store
                : store // ignore: cast_nullable_to_non_nullable
                    as AuthStateStore,
        isAccountNotFound:
            null == isAccountNotFound
                ? _value.isAccountNotFound
                : isAccountNotFound // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl({required this.store, this.isAccountNotFound = false});

  @override
  final AuthStateStore store;
  @override
  @JsonKey()
  final bool isAccountNotFound;

  @override
  String toString() {
    return 'AuthState.error(store: $store, isAccountNotFound: $isAccountNotFound)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.isAccountNotFound, isAccountNotFound) ||
                other.isAccountNotFound == isAccountNotFound));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store, isAccountNotFound);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStateStore store) initial,
    required TResult Function(AuthStateStore store) loading,
    required TResult Function(AuthStateStore store) otpSent,
    required TResult Function(AuthStateStore store) otpVerified,
    required TResult Function(AuthStateStore store) exchangeTokenVerified,
    required TResult Function(AuthStateStore store) createCompanySuccess,
    required TResult Function(AuthStateStore store, bool isAccountNotFound)
    error,
    required TResult Function(AuthStateStore store) phoneNumberError,
    required TResult Function(AuthStateStore store) otpVerifiedError,
    required TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )
    createCompanyError,
  }) {
    return error(store, isAccountNotFound);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStateStore store)? initial,
    TResult? Function(AuthStateStore store)? loading,
    TResult? Function(AuthStateStore store)? otpSent,
    TResult? Function(AuthStateStore store)? otpVerified,
    TResult? Function(AuthStateStore store)? exchangeTokenVerified,
    TResult? Function(AuthStateStore store)? createCompanySuccess,
    TResult? Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult? Function(AuthStateStore store)? phoneNumberError,
    TResult? Function(AuthStateStore store)? otpVerifiedError,
    TResult? Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
  }) {
    return error?.call(store, isAccountNotFound);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStateStore store)? initial,
    TResult Function(AuthStateStore store)? loading,
    TResult Function(AuthStateStore store)? otpSent,
    TResult Function(AuthStateStore store)? otpVerified,
    TResult Function(AuthStateStore store)? exchangeTokenVerified,
    TResult Function(AuthStateStore store)? createCompanySuccess,
    TResult Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult Function(AuthStateStore store)? phoneNumberError,
    TResult Function(AuthStateStore store)? otpVerifiedError,
    TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(store, isAccountNotFound);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(OTPSent value) otpSent,
    required TResult Function(OTPVerified value) otpVerified,
    required TResult Function(ExchangeTokenVerified value)
    exchangeTokenVerified,
    required TResult Function(CreateCompanySuccess value) createCompanySuccess,
    required TResult Function(Error value) error,
    required TResult Function(PhoneNumberError value) phoneNumberError,
    required TResult Function(OtpVerifiedError value) otpVerifiedError,
    required TResult Function(CreateCompanyError value) createCompanyError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(OTPSent value)? otpSent,
    TResult? Function(OTPVerified value)? otpVerified,
    TResult? Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult? Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult? Function(Error value)? error,
    TResult? Function(PhoneNumberError value)? phoneNumberError,
    TResult? Function(OtpVerifiedError value)? otpVerifiedError,
    TResult? Function(CreateCompanyError value)? createCompanyError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(OTPSent value)? otpSent,
    TResult Function(OTPVerified value)? otpVerified,
    TResult Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult Function(Error value)? error,
    TResult Function(PhoneNumberError value)? phoneNumberError,
    TResult Function(OtpVerifiedError value)? otpVerifiedError,
    TResult Function(CreateCompanyError value)? createCompanyError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AuthState {
  const factory Error({
    required final AuthStateStore store,
    final bool isAccountNotFound,
  }) = _$ErrorImpl;

  @override
  AuthStateStore get store;
  bool get isAccountNotFound;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneNumberErrorImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$PhoneNumberErrorImplCopyWith(
    _$PhoneNumberErrorImpl value,
    $Res Function(_$PhoneNumberErrorImpl) then,
  ) = __$$PhoneNumberErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStateStore store});

  @override
  $AuthStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$PhoneNumberErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$PhoneNumberErrorImpl>
    implements _$$PhoneNumberErrorImplCopyWith<$Res> {
  __$$PhoneNumberErrorImplCopyWithImpl(
    _$PhoneNumberErrorImpl _value,
    $Res Function(_$PhoneNumberErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$PhoneNumberErrorImpl(
        store:
            null == store
                ? _value.store
                : store // ignore: cast_nullable_to_non_nullable
                    as AuthStateStore,
      ),
    );
  }
}

/// @nodoc

class _$PhoneNumberErrorImpl implements PhoneNumberError {
  const _$PhoneNumberErrorImpl({required this.store});

  @override
  final AuthStateStore store;

  @override
  String toString() {
    return 'AuthState.phoneNumberError(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberErrorImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberErrorImplCopyWith<_$PhoneNumberErrorImpl> get copyWith =>
      __$$PhoneNumberErrorImplCopyWithImpl<_$PhoneNumberErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStateStore store) initial,
    required TResult Function(AuthStateStore store) loading,
    required TResult Function(AuthStateStore store) otpSent,
    required TResult Function(AuthStateStore store) otpVerified,
    required TResult Function(AuthStateStore store) exchangeTokenVerified,
    required TResult Function(AuthStateStore store) createCompanySuccess,
    required TResult Function(AuthStateStore store, bool isAccountNotFound)
    error,
    required TResult Function(AuthStateStore store) phoneNumberError,
    required TResult Function(AuthStateStore store) otpVerifiedError,
    required TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )
    createCompanyError,
  }) {
    return phoneNumberError(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStateStore store)? initial,
    TResult? Function(AuthStateStore store)? loading,
    TResult? Function(AuthStateStore store)? otpSent,
    TResult? Function(AuthStateStore store)? otpVerified,
    TResult? Function(AuthStateStore store)? exchangeTokenVerified,
    TResult? Function(AuthStateStore store)? createCompanySuccess,
    TResult? Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult? Function(AuthStateStore store)? phoneNumberError,
    TResult? Function(AuthStateStore store)? otpVerifiedError,
    TResult? Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
  }) {
    return phoneNumberError?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStateStore store)? initial,
    TResult Function(AuthStateStore store)? loading,
    TResult Function(AuthStateStore store)? otpSent,
    TResult Function(AuthStateStore store)? otpVerified,
    TResult Function(AuthStateStore store)? exchangeTokenVerified,
    TResult Function(AuthStateStore store)? createCompanySuccess,
    TResult Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult Function(AuthStateStore store)? phoneNumberError,
    TResult Function(AuthStateStore store)? otpVerifiedError,
    TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
    required TResult orElse(),
  }) {
    if (phoneNumberError != null) {
      return phoneNumberError(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(OTPSent value) otpSent,
    required TResult Function(OTPVerified value) otpVerified,
    required TResult Function(ExchangeTokenVerified value)
    exchangeTokenVerified,
    required TResult Function(CreateCompanySuccess value) createCompanySuccess,
    required TResult Function(Error value) error,
    required TResult Function(PhoneNumberError value) phoneNumberError,
    required TResult Function(OtpVerifiedError value) otpVerifiedError,
    required TResult Function(CreateCompanyError value) createCompanyError,
  }) {
    return phoneNumberError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(OTPSent value)? otpSent,
    TResult? Function(OTPVerified value)? otpVerified,
    TResult? Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult? Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult? Function(Error value)? error,
    TResult? Function(PhoneNumberError value)? phoneNumberError,
    TResult? Function(OtpVerifiedError value)? otpVerifiedError,
    TResult? Function(CreateCompanyError value)? createCompanyError,
  }) {
    return phoneNumberError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(OTPSent value)? otpSent,
    TResult Function(OTPVerified value)? otpVerified,
    TResult Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult Function(Error value)? error,
    TResult Function(PhoneNumberError value)? phoneNumberError,
    TResult Function(OtpVerifiedError value)? otpVerifiedError,
    TResult Function(CreateCompanyError value)? createCompanyError,
    required TResult orElse(),
  }) {
    if (phoneNumberError != null) {
      return phoneNumberError(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberError implements AuthState {
  const factory PhoneNumberError({required final AuthStateStore store}) =
      _$PhoneNumberErrorImpl;

  @override
  AuthStateStore get store;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneNumberErrorImplCopyWith<_$PhoneNumberErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpVerifiedErrorImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$OtpVerifiedErrorImplCopyWith(
    _$OtpVerifiedErrorImpl value,
    $Res Function(_$OtpVerifiedErrorImpl) then,
  ) = __$$OtpVerifiedErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStateStore store});

  @override
  $AuthStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$OtpVerifiedErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$OtpVerifiedErrorImpl>
    implements _$$OtpVerifiedErrorImplCopyWith<$Res> {
  __$$OtpVerifiedErrorImplCopyWithImpl(
    _$OtpVerifiedErrorImpl _value,
    $Res Function(_$OtpVerifiedErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$OtpVerifiedErrorImpl(
        store:
            null == store
                ? _value.store
                : store // ignore: cast_nullable_to_non_nullable
                    as AuthStateStore,
      ),
    );
  }
}

/// @nodoc

class _$OtpVerifiedErrorImpl implements OtpVerifiedError {
  const _$OtpVerifiedErrorImpl({required this.store});

  @override
  final AuthStateStore store;

  @override
  String toString() {
    return 'AuthState.otpVerifiedError(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerifiedErrorImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerifiedErrorImplCopyWith<_$OtpVerifiedErrorImpl> get copyWith =>
      __$$OtpVerifiedErrorImplCopyWithImpl<_$OtpVerifiedErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStateStore store) initial,
    required TResult Function(AuthStateStore store) loading,
    required TResult Function(AuthStateStore store) otpSent,
    required TResult Function(AuthStateStore store) otpVerified,
    required TResult Function(AuthStateStore store) exchangeTokenVerified,
    required TResult Function(AuthStateStore store) createCompanySuccess,
    required TResult Function(AuthStateStore store, bool isAccountNotFound)
    error,
    required TResult Function(AuthStateStore store) phoneNumberError,
    required TResult Function(AuthStateStore store) otpVerifiedError,
    required TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )
    createCompanyError,
  }) {
    return otpVerifiedError(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStateStore store)? initial,
    TResult? Function(AuthStateStore store)? loading,
    TResult? Function(AuthStateStore store)? otpSent,
    TResult? Function(AuthStateStore store)? otpVerified,
    TResult? Function(AuthStateStore store)? exchangeTokenVerified,
    TResult? Function(AuthStateStore store)? createCompanySuccess,
    TResult? Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult? Function(AuthStateStore store)? phoneNumberError,
    TResult? Function(AuthStateStore store)? otpVerifiedError,
    TResult? Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
  }) {
    return otpVerifiedError?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStateStore store)? initial,
    TResult Function(AuthStateStore store)? loading,
    TResult Function(AuthStateStore store)? otpSent,
    TResult Function(AuthStateStore store)? otpVerified,
    TResult Function(AuthStateStore store)? exchangeTokenVerified,
    TResult Function(AuthStateStore store)? createCompanySuccess,
    TResult Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult Function(AuthStateStore store)? phoneNumberError,
    TResult Function(AuthStateStore store)? otpVerifiedError,
    TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
    required TResult orElse(),
  }) {
    if (otpVerifiedError != null) {
      return otpVerifiedError(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(OTPSent value) otpSent,
    required TResult Function(OTPVerified value) otpVerified,
    required TResult Function(ExchangeTokenVerified value)
    exchangeTokenVerified,
    required TResult Function(CreateCompanySuccess value) createCompanySuccess,
    required TResult Function(Error value) error,
    required TResult Function(PhoneNumberError value) phoneNumberError,
    required TResult Function(OtpVerifiedError value) otpVerifiedError,
    required TResult Function(CreateCompanyError value) createCompanyError,
  }) {
    return otpVerifiedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(OTPSent value)? otpSent,
    TResult? Function(OTPVerified value)? otpVerified,
    TResult? Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult? Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult? Function(Error value)? error,
    TResult? Function(PhoneNumberError value)? phoneNumberError,
    TResult? Function(OtpVerifiedError value)? otpVerifiedError,
    TResult? Function(CreateCompanyError value)? createCompanyError,
  }) {
    return otpVerifiedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(OTPSent value)? otpSent,
    TResult Function(OTPVerified value)? otpVerified,
    TResult Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult Function(Error value)? error,
    TResult Function(PhoneNumberError value)? phoneNumberError,
    TResult Function(OtpVerifiedError value)? otpVerifiedError,
    TResult Function(CreateCompanyError value)? createCompanyError,
    required TResult orElse(),
  }) {
    if (otpVerifiedError != null) {
      return otpVerifiedError(this);
    }
    return orElse();
  }
}

abstract class OtpVerifiedError implements AuthState {
  const factory OtpVerifiedError({required final AuthStateStore store}) =
      _$OtpVerifiedErrorImpl;

  @override
  AuthStateStore get store;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerifiedErrorImplCopyWith<_$OtpVerifiedErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateCompanyErrorImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$CreateCompanyErrorImplCopyWith(
    _$CreateCompanyErrorImpl value,
    $Res Function(_$CreateCompanyErrorImpl) then,
  ) = __$$CreateCompanyErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AuthStateStore store,
    String? companyExistsMessage,
    String? maskedPhoneNumber,
  });

  @override
  $AuthStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$CreateCompanyErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$CreateCompanyErrorImpl>
    implements _$$CreateCompanyErrorImplCopyWith<$Res> {
  __$$CreateCompanyErrorImplCopyWithImpl(
    _$CreateCompanyErrorImpl _value,
    $Res Function(_$CreateCompanyErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
    Object? companyExistsMessage = freezed,
    Object? maskedPhoneNumber = freezed,
  }) {
    return _then(
      _$CreateCompanyErrorImpl(
        store:
            null == store
                ? _value.store
                : store // ignore: cast_nullable_to_non_nullable
                    as AuthStateStore,
        companyExistsMessage:
            freezed == companyExistsMessage
                ? _value.companyExistsMessage
                : companyExistsMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        maskedPhoneNumber:
            freezed == maskedPhoneNumber
                ? _value.maskedPhoneNumber
                : maskedPhoneNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$CreateCompanyErrorImpl implements CreateCompanyError {
  const _$CreateCompanyErrorImpl({
    required this.store,
    this.companyExistsMessage,
    this.maskedPhoneNumber,
  });

  @override
  final AuthStateStore store;
  @override
  final String? companyExistsMessage;
  @override
  final String? maskedPhoneNumber;

  @override
  String toString() {
    return 'AuthState.createCompanyError(store: $store, companyExistsMessage: $companyExistsMessage, maskedPhoneNumber: $maskedPhoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCompanyErrorImpl &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.companyExistsMessage, companyExistsMessage) ||
                other.companyExistsMessage == companyExistsMessage) &&
            (identical(other.maskedPhoneNumber, maskedPhoneNumber) ||
                other.maskedPhoneNumber == maskedPhoneNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, store, companyExistsMessage, maskedPhoneNumber);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCompanyErrorImplCopyWith<_$CreateCompanyErrorImpl> get copyWith =>
      __$$CreateCompanyErrorImplCopyWithImpl<_$CreateCompanyErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStateStore store) initial,
    required TResult Function(AuthStateStore store) loading,
    required TResult Function(AuthStateStore store) otpSent,
    required TResult Function(AuthStateStore store) otpVerified,
    required TResult Function(AuthStateStore store) exchangeTokenVerified,
    required TResult Function(AuthStateStore store) createCompanySuccess,
    required TResult Function(AuthStateStore store, bool isAccountNotFound)
    error,
    required TResult Function(AuthStateStore store) phoneNumberError,
    required TResult Function(AuthStateStore store) otpVerifiedError,
    required TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )
    createCompanyError,
  }) {
    return createCompanyError(store, companyExistsMessage, maskedPhoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStateStore store)? initial,
    TResult? Function(AuthStateStore store)? loading,
    TResult? Function(AuthStateStore store)? otpSent,
    TResult? Function(AuthStateStore store)? otpVerified,
    TResult? Function(AuthStateStore store)? exchangeTokenVerified,
    TResult? Function(AuthStateStore store)? createCompanySuccess,
    TResult? Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult? Function(AuthStateStore store)? phoneNumberError,
    TResult? Function(AuthStateStore store)? otpVerifiedError,
    TResult? Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
  }) {
    return createCompanyError?.call(
      store,
      companyExistsMessage,
      maskedPhoneNumber,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStateStore store)? initial,
    TResult Function(AuthStateStore store)? loading,
    TResult Function(AuthStateStore store)? otpSent,
    TResult Function(AuthStateStore store)? otpVerified,
    TResult Function(AuthStateStore store)? exchangeTokenVerified,
    TResult Function(AuthStateStore store)? createCompanySuccess,
    TResult Function(AuthStateStore store, bool isAccountNotFound)? error,
    TResult Function(AuthStateStore store)? phoneNumberError,
    TResult Function(AuthStateStore store)? otpVerifiedError,
    TResult Function(
      AuthStateStore store,
      String? companyExistsMessage,
      String? maskedPhoneNumber,
    )?
    createCompanyError,
    required TResult orElse(),
  }) {
    if (createCompanyError != null) {
      return createCompanyError(store, companyExistsMessage, maskedPhoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(OTPSent value) otpSent,
    required TResult Function(OTPVerified value) otpVerified,
    required TResult Function(ExchangeTokenVerified value)
    exchangeTokenVerified,
    required TResult Function(CreateCompanySuccess value) createCompanySuccess,
    required TResult Function(Error value) error,
    required TResult Function(PhoneNumberError value) phoneNumberError,
    required TResult Function(OtpVerifiedError value) otpVerifiedError,
    required TResult Function(CreateCompanyError value) createCompanyError,
  }) {
    return createCompanyError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(OTPSent value)? otpSent,
    TResult? Function(OTPVerified value)? otpVerified,
    TResult? Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult? Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult? Function(Error value)? error,
    TResult? Function(PhoneNumberError value)? phoneNumberError,
    TResult? Function(OtpVerifiedError value)? otpVerifiedError,
    TResult? Function(CreateCompanyError value)? createCompanyError,
  }) {
    return createCompanyError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(OTPSent value)? otpSent,
    TResult Function(OTPVerified value)? otpVerified,
    TResult Function(ExchangeTokenVerified value)? exchangeTokenVerified,
    TResult Function(CreateCompanySuccess value)? createCompanySuccess,
    TResult Function(Error value)? error,
    TResult Function(PhoneNumberError value)? phoneNumberError,
    TResult Function(OtpVerifiedError value)? otpVerifiedError,
    TResult Function(CreateCompanyError value)? createCompanyError,
    required TResult orElse(),
  }) {
    if (createCompanyError != null) {
      return createCompanyError(this);
    }
    return orElse();
  }
}

abstract class CreateCompanyError implements AuthState {
  const factory CreateCompanyError({
    required final AuthStateStore store,
    final String? companyExistsMessage,
    final String? maskedPhoneNumber,
  }) = _$CreateCompanyErrorImpl;

  @override
  AuthStateStore get store;
  String? get companyExistsMessage;
  String? get maskedPhoneNumber;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCompanyErrorImplCopyWith<_$CreateCompanyErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthStateStore {
  bool get loading => throw _privateConstructorUsedError;
  String get verificationId => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  CreateCompanyModel? get createCompanyModel =>
      throw _privateConstructorUsedError;
  ExchangeTokenModel? get exchangeTokenModel =>
      throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  /// Create a copy of AuthStateStore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateStoreCopyWith<AuthStateStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateStoreCopyWith<$Res> {
  factory $AuthStateStoreCopyWith(
    AuthStateStore value,
    $Res Function(AuthStateStore) then,
  ) = _$AuthStateStoreCopyWithImpl<$Res, AuthStateStore>;
  @useResult
  $Res call({
    bool loading,
    String verificationId,
    String phoneNumber,
    String? errorMessage,
    CreateCompanyModel? createCompanyModel,
    ExchangeTokenModel? exchangeTokenModel,
    UserModel? user,
  });
}

/// @nodoc
class _$AuthStateStoreCopyWithImpl<$Res, $Val extends AuthStateStore>
    implements $AuthStateStoreCopyWith<$Res> {
  _$AuthStateStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthStateStore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? verificationId = null,
    Object? phoneNumber = null,
    Object? errorMessage = freezed,
    Object? createCompanyModel = freezed,
    Object? exchangeTokenModel = freezed,
    Object? user = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            verificationId:
                null == verificationId
                    ? _value.verificationId
                    : verificationId // ignore: cast_nullable_to_non_nullable
                        as String,
            phoneNumber:
                null == phoneNumber
                    ? _value.phoneNumber
                    : phoneNumber // ignore: cast_nullable_to_non_nullable
                        as String,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            createCompanyModel:
                freezed == createCompanyModel
                    ? _value.createCompanyModel
                    : createCompanyModel // ignore: cast_nullable_to_non_nullable
                        as CreateCompanyModel?,
            exchangeTokenModel:
                freezed == exchangeTokenModel
                    ? _value.exchangeTokenModel
                    : exchangeTokenModel // ignore: cast_nullable_to_non_nullable
                        as ExchangeTokenModel?,
            user:
                freezed == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as UserModel?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthStateStoreImplCopyWith<$Res>
    implements $AuthStateStoreCopyWith<$Res> {
  factory _$$AuthStateStoreImplCopyWith(
    _$AuthStateStoreImpl value,
    $Res Function(_$AuthStateStoreImpl) then,
  ) = __$$AuthStateStoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    String verificationId,
    String phoneNumber,
    String? errorMessage,
    CreateCompanyModel? createCompanyModel,
    ExchangeTokenModel? exchangeTokenModel,
    UserModel? user,
  });
}

/// @nodoc
class __$$AuthStateStoreImplCopyWithImpl<$Res>
    extends _$AuthStateStoreCopyWithImpl<$Res, _$AuthStateStoreImpl>
    implements _$$AuthStateStoreImplCopyWith<$Res> {
  __$$AuthStateStoreImplCopyWithImpl(
    _$AuthStateStoreImpl _value,
    $Res Function(_$AuthStateStoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthStateStore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? verificationId = null,
    Object? phoneNumber = null,
    Object? errorMessage = freezed,
    Object? createCompanyModel = freezed,
    Object? exchangeTokenModel = freezed,
    Object? user = freezed,
  }) {
    return _then(
      _$AuthStateStoreImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        verificationId:
            null == verificationId
                ? _value.verificationId
                : verificationId // ignore: cast_nullable_to_non_nullable
                    as String,
        phoneNumber:
            null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                    as String,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        createCompanyModel:
            freezed == createCompanyModel
                ? _value.createCompanyModel
                : createCompanyModel // ignore: cast_nullable_to_non_nullable
                    as CreateCompanyModel?,
        exchangeTokenModel:
            freezed == exchangeTokenModel
                ? _value.exchangeTokenModel
                : exchangeTokenModel // ignore: cast_nullable_to_non_nullable
                    as ExchangeTokenModel?,
        user:
            freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as UserModel?,
      ),
    );
  }
}

/// @nodoc

class _$AuthStateStoreImpl implements _AuthStateStore {
  const _$AuthStateStoreImpl({
    this.loading = false,
    this.verificationId = "",
    this.phoneNumber = "",
    this.errorMessage,
    this.createCompanyModel,
    this.exchangeTokenModel,
    this.user,
  });

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final String verificationId;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  final String? errorMessage;
  @override
  final CreateCompanyModel? createCompanyModel;
  @override
  final ExchangeTokenModel? exchangeTokenModel;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'AuthStateStore(loading: $loading, verificationId: $verificationId, phoneNumber: $phoneNumber, errorMessage: $errorMessage, createCompanyModel: $createCompanyModel, exchangeTokenModel: $exchangeTokenModel, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateStoreImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.createCompanyModel, createCompanyModel) ||
                other.createCompanyModel == createCompanyModel) &&
            (identical(other.exchangeTokenModel, exchangeTokenModel) ||
                other.exchangeTokenModel == exchangeTokenModel) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    verificationId,
    phoneNumber,
    errorMessage,
    createCompanyModel,
    exchangeTokenModel,
    user,
  );

  /// Create a copy of AuthStateStore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateStoreImplCopyWith<_$AuthStateStoreImpl> get copyWith =>
      __$$AuthStateStoreImplCopyWithImpl<_$AuthStateStoreImpl>(
        this,
        _$identity,
      );
}

abstract class _AuthStateStore implements AuthStateStore {
  const factory _AuthStateStore({
    final bool loading,
    final String verificationId,
    final String phoneNumber,
    final String? errorMessage,
    final CreateCompanyModel? createCompanyModel,
    final ExchangeTokenModel? exchangeTokenModel,
    final UserModel? user,
  }) = _$AuthStateStoreImpl;

  @override
  bool get loading;
  @override
  String get verificationId;
  @override
  String get phoneNumber;
  @override
  String? get errorMessage;
  @override
  CreateCompanyModel? get createCompanyModel;
  @override
  ExchangeTokenModel? get exchangeTokenModel;
  @override
  UserModel? get user;

  /// Create a copy of AuthStateStore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateStoreImplCopyWith<_$AuthStateStoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
