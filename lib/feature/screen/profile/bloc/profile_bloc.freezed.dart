// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String jobId, JobPosting jobPostingData)
    updateJobSuccessEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String jobId, JobPosting jobPostingData)?
    updateJobSuccessEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String jobId, JobPosting jobPostingData)?
    updateJobSuccessEvent,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateJobSuccessEvent value)
    updateJobSuccessEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UpdateJobSuccessEvent value)? updateJobSuccessEvent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateJobSuccessEvent value)? updateJobSuccessEvent,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
    ProfileEvent value,
    $Res Function(ProfileEvent) then,
  ) = _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEvent
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
    extends _$ProfileEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ProfileEvent.started()';
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
    required TResult Function(String jobId, JobPosting jobPostingData)
    updateJobSuccessEvent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String jobId, JobPosting jobPostingData)?
    updateJobSuccessEvent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String jobId, JobPosting jobPostingData)?
    updateJobSuccessEvent,
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
    required TResult Function(_UpdateJobSuccessEvent value)
    updateJobSuccessEvent,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UpdateJobSuccessEvent value)? updateJobSuccessEvent,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateJobSuccessEvent value)? updateJobSuccessEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ProfileEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$UpdateJobSuccessEventImplCopyWith<$Res> {
  factory _$$UpdateJobSuccessEventImplCopyWith(
    _$UpdateJobSuccessEventImpl value,
    $Res Function(_$UpdateJobSuccessEventImpl) then,
  ) = __$$UpdateJobSuccessEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String jobId, JobPosting jobPostingData});
}

/// @nodoc
class __$$UpdateJobSuccessEventImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UpdateJobSuccessEventImpl>
    implements _$$UpdateJobSuccessEventImplCopyWith<$Res> {
  __$$UpdateJobSuccessEventImplCopyWithImpl(
    _$UpdateJobSuccessEventImpl _value,
    $Res Function(_$UpdateJobSuccessEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? jobId = null, Object? jobPostingData = null}) {
    return _then(
      _$UpdateJobSuccessEventImpl(
        jobId:
            null == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
                    as String,
        jobPostingData:
            null == jobPostingData
                ? _value.jobPostingData
                : jobPostingData // ignore: cast_nullable_to_non_nullable
                    as JobPosting,
      ),
    );
  }
}

/// @nodoc

class _$UpdateJobSuccessEventImpl implements _UpdateJobSuccessEvent {
  const _$UpdateJobSuccessEventImpl({
    required this.jobId,
    required this.jobPostingData,
  });

  @override
  final String jobId;
  @override
  final JobPosting jobPostingData;

  @override
  String toString() {
    return 'ProfileEvent.updateJobSuccessEvent(jobId: $jobId, jobPostingData: $jobPostingData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateJobSuccessEventImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.jobPostingData, jobPostingData) ||
                other.jobPostingData == jobPostingData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jobId, jobPostingData);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateJobSuccessEventImplCopyWith<_$UpdateJobSuccessEventImpl>
  get copyWith =>
      __$$UpdateJobSuccessEventImplCopyWithImpl<_$UpdateJobSuccessEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String jobId, JobPosting jobPostingData)
    updateJobSuccessEvent,
  }) {
    return updateJobSuccessEvent(jobId, jobPostingData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String jobId, JobPosting jobPostingData)?
    updateJobSuccessEvent,
  }) {
    return updateJobSuccessEvent?.call(jobId, jobPostingData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String jobId, JobPosting jobPostingData)?
    updateJobSuccessEvent,
    required TResult orElse(),
  }) {
    if (updateJobSuccessEvent != null) {
      return updateJobSuccessEvent(jobId, jobPostingData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateJobSuccessEvent value)
    updateJobSuccessEvent,
  }) {
    return updateJobSuccessEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UpdateJobSuccessEvent value)? updateJobSuccessEvent,
  }) {
    return updateJobSuccessEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateJobSuccessEvent value)? updateJobSuccessEvent,
    required TResult orElse(),
  }) {
    if (updateJobSuccessEvent != null) {
      return updateJobSuccessEvent(this);
    }
    return orElse();
  }
}

abstract class _UpdateJobSuccessEvent implements ProfileEvent {
  const factory _UpdateJobSuccessEvent({
    required final String jobId,
    required final JobPosting jobPostingData,
  }) = _$UpdateJobSuccessEventImpl;

  String get jobId;
  JobPosting get jobPostingData;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateJobSuccessEventImplCopyWith<_$UpdateJobSuccessEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileState {
  ProfileStateStore get store => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileStateStore store) initial,
    required TResult Function(ProfileStateStore store) loading,
    required TResult Function(ProfileStateStore store) updateJobSuccess,
    required TResult Function(ProfileStateStore store, String errorMessage)
    error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateStore store)? initial,
    TResult? Function(ProfileStateStore store)? loading,
    TResult? Function(ProfileStateStore store)? updateJobSuccess,
    TResult? Function(ProfileStateStore store, String errorMessage)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileStateStore store)? initial,
    TResult Function(ProfileStateStore store)? loading,
    TResult Function(ProfileStateStore store)? updateJobSuccess,
    TResult Function(ProfileStateStore store, String errorMessage)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateJobSuccess value) updateJobSuccess,
    required TResult Function(Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateJobSuccess value)? updateJobSuccess,
    TResult? Function(Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateJobSuccess value)? updateJobSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
    ProfileState value,
    $Res Function(ProfileState) then,
  ) = _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call({ProfileStateStore store});

  $ProfileStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
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
                        as ProfileStateStore,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileStateStoreCopyWith<$Res> get store {
    return $ProfileStateStoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProfileStateStore store});

  @override
  $ProfileStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$InitialImpl(
        null == store
            ? _value.store
            : store // ignore: cast_nullable_to_non_nullable
                as ProfileStateStore,
      ),
    );
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl(this.store);

  @override
  final ProfileStateStore store;

  @override
  String toString() {
    return 'ProfileState.initial(store: $store)';
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

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileStateStore store) initial,
    required TResult Function(ProfileStateStore store) loading,
    required TResult Function(ProfileStateStore store) updateJobSuccess,
    required TResult Function(ProfileStateStore store, String errorMessage)
    error,
  }) {
    return initial(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateStore store)? initial,
    TResult? Function(ProfileStateStore store)? loading,
    TResult? Function(ProfileStateStore store)? updateJobSuccess,
    TResult? Function(ProfileStateStore store, String errorMessage)? error,
  }) {
    return initial?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileStateStore store)? initial,
    TResult Function(ProfileStateStore store)? loading,
    TResult Function(ProfileStateStore store)? updateJobSuccess,
    TResult Function(ProfileStateStore store, String errorMessage)? error,
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
    required TResult Function(UpdateJobSuccess value) updateJobSuccess,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateJobSuccess value)? updateJobSuccess,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateJobSuccess value)? updateJobSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ProfileState {
  const factory Initial(final ProfileStateStore store) = _$InitialImpl;

  @override
  ProfileStateStore get store;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProfileStateStore store});

  @override
  $ProfileStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$LoadingImpl(
        null == store
            ? _value.store
            : store // ignore: cast_nullable_to_non_nullable
                as ProfileStateStore,
      ),
    );
  }
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl(this.store);

  @override
  final ProfileStateStore store;

  @override
  String toString() {
    return 'ProfileState.loading(store: $store)';
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

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileStateStore store) initial,
    required TResult Function(ProfileStateStore store) loading,
    required TResult Function(ProfileStateStore store) updateJobSuccess,
    required TResult Function(ProfileStateStore store, String errorMessage)
    error,
  }) {
    return loading(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateStore store)? initial,
    TResult? Function(ProfileStateStore store)? loading,
    TResult? Function(ProfileStateStore store)? updateJobSuccess,
    TResult? Function(ProfileStateStore store, String errorMessage)? error,
  }) {
    return loading?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileStateStore store)? initial,
    TResult Function(ProfileStateStore store)? loading,
    TResult Function(ProfileStateStore store)? updateJobSuccess,
    TResult Function(ProfileStateStore store, String errorMessage)? error,
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
    required TResult Function(UpdateJobSuccess value) updateJobSuccess,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateJobSuccess value)? updateJobSuccess,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateJobSuccess value)? updateJobSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ProfileState {
  const factory Loading(final ProfileStateStore store) = _$LoadingImpl;

  @override
  ProfileStateStore get store;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateJobSuccessImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$UpdateJobSuccessImplCopyWith(
    _$UpdateJobSuccessImpl value,
    $Res Function(_$UpdateJobSuccessImpl) then,
  ) = __$$UpdateJobSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProfileStateStore store});

  @override
  $ProfileStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$UpdateJobSuccessImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$UpdateJobSuccessImpl>
    implements _$$UpdateJobSuccessImplCopyWith<$Res> {
  __$$UpdateJobSuccessImplCopyWithImpl(
    _$UpdateJobSuccessImpl _value,
    $Res Function(_$UpdateJobSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$UpdateJobSuccessImpl(
        store:
            null == store
                ? _value.store
                : store // ignore: cast_nullable_to_non_nullable
                    as ProfileStateStore,
      ),
    );
  }
}

/// @nodoc

class _$UpdateJobSuccessImpl implements UpdateJobSuccess {
  const _$UpdateJobSuccessImpl({required this.store});

  @override
  final ProfileStateStore store;

  @override
  String toString() {
    return 'ProfileState.updateJobSuccess(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateJobSuccessImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateJobSuccessImplCopyWith<_$UpdateJobSuccessImpl> get copyWith =>
      __$$UpdateJobSuccessImplCopyWithImpl<_$UpdateJobSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileStateStore store) initial,
    required TResult Function(ProfileStateStore store) loading,
    required TResult Function(ProfileStateStore store) updateJobSuccess,
    required TResult Function(ProfileStateStore store, String errorMessage)
    error,
  }) {
    return updateJobSuccess(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateStore store)? initial,
    TResult? Function(ProfileStateStore store)? loading,
    TResult? Function(ProfileStateStore store)? updateJobSuccess,
    TResult? Function(ProfileStateStore store, String errorMessage)? error,
  }) {
    return updateJobSuccess?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileStateStore store)? initial,
    TResult Function(ProfileStateStore store)? loading,
    TResult Function(ProfileStateStore store)? updateJobSuccess,
    TResult Function(ProfileStateStore store, String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (updateJobSuccess != null) {
      return updateJobSuccess(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateJobSuccess value) updateJobSuccess,
    required TResult Function(Error value) error,
  }) {
    return updateJobSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateJobSuccess value)? updateJobSuccess,
    TResult? Function(Error value)? error,
  }) {
    return updateJobSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateJobSuccess value)? updateJobSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (updateJobSuccess != null) {
      return updateJobSuccess(this);
    }
    return orElse();
  }
}

abstract class UpdateJobSuccess implements ProfileState {
  const factory UpdateJobSuccess({required final ProfileStateStore store}) =
      _$UpdateJobSuccessImpl;

  @override
  ProfileStateStore get store;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateJobSuccessImplCopyWith<_$UpdateJobSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProfileStateStore store, String errorMessage});

  @override
  $ProfileStateStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null, Object? errorMessage = null}) {
    return _then(
      _$ErrorImpl(
        null == store
            ? _value.store
            : store // ignore: cast_nullable_to_non_nullable
                as ProfileStateStore,
        null == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.store, this.errorMessage);

  @override
  final ProfileStateStore store;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ProfileState.error(store: $store, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store, errorMessage);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileStateStore store) initial,
    required TResult Function(ProfileStateStore store) loading,
    required TResult Function(ProfileStateStore store) updateJobSuccess,
    required TResult Function(ProfileStateStore store, String errorMessage)
    error,
  }) {
    return error(store, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateStore store)? initial,
    TResult? Function(ProfileStateStore store)? loading,
    TResult? Function(ProfileStateStore store)? updateJobSuccess,
    TResult? Function(ProfileStateStore store, String errorMessage)? error,
  }) {
    return error?.call(store, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileStateStore store)? initial,
    TResult Function(ProfileStateStore store)? loading,
    TResult Function(ProfileStateStore store)? updateJobSuccess,
    TResult Function(ProfileStateStore store, String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(store, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateJobSuccess value) updateJobSuccess,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateJobSuccess value)? updateJobSuccess,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateJobSuccess value)? updateJobSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ProfileState {
  const factory Error(
    final ProfileStateStore store,
    final String errorMessage,
  ) = _$ErrorImpl;

  @override
  ProfileStateStore get store;
  String get errorMessage;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileStateStore {
  bool get loading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  JobPosting? get jobPosting => throw _privateConstructorUsedError;

  /// Create a copy of ProfileStateStore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileStateStoreCopyWith<ProfileStateStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateStoreCopyWith<$Res> {
  factory $ProfileStateStoreCopyWith(
    ProfileStateStore value,
    $Res Function(ProfileStateStore) then,
  ) = _$ProfileStateStoreCopyWithImpl<$Res, ProfileStateStore>;
  @useResult
  $Res call({bool loading, String errorMessage, JobPosting? jobPosting});
}

/// @nodoc
class _$ProfileStateStoreCopyWithImpl<$Res, $Val extends ProfileStateStore>
    implements $ProfileStateStoreCopyWith<$Res> {
  _$ProfileStateStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileStateStore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorMessage = null,
    Object? jobPosting = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            errorMessage:
                null == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String,
            jobPosting:
                freezed == jobPosting
                    ? _value.jobPosting
                    : jobPosting // ignore: cast_nullable_to_non_nullable
                        as JobPosting?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileStateStoreImplCopyWith<$Res>
    implements $ProfileStateStoreCopyWith<$Res> {
  factory _$$ProfileStateStoreImplCopyWith(
    _$ProfileStateStoreImpl value,
    $Res Function(_$ProfileStateStoreImpl) then,
  ) = __$$ProfileStateStoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, String errorMessage, JobPosting? jobPosting});
}

/// @nodoc
class __$$ProfileStateStoreImplCopyWithImpl<$Res>
    extends _$ProfileStateStoreCopyWithImpl<$Res, _$ProfileStateStoreImpl>
    implements _$$ProfileStateStoreImplCopyWith<$Res> {
  __$$ProfileStateStoreImplCopyWithImpl(
    _$ProfileStateStoreImpl _value,
    $Res Function(_$ProfileStateStoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileStateStore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorMessage = null,
    Object? jobPosting = freezed,
  }) {
    return _then(
      _$ProfileStateStoreImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        errorMessage:
            null == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String,
        jobPosting:
            freezed == jobPosting
                ? _value.jobPosting
                : jobPosting // ignore: cast_nullable_to_non_nullable
                    as JobPosting?,
      ),
    );
  }
}

/// @nodoc

class _$ProfileStateStoreImpl implements _ProfileStateStore {
  const _$ProfileStateStoreImpl({
    this.loading = false,
    this.errorMessage = "",
    this.jobPosting,
  });

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final JobPosting? jobPosting;

  @override
  String toString() {
    return 'ProfileStateStore(loading: $loading, errorMessage: $errorMessage, jobPosting: $jobPosting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateStoreImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.jobPosting, jobPosting) ||
                other.jobPosting == jobPosting));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loading, errorMessage, jobPosting);

  /// Create a copy of ProfileStateStore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateStoreImplCopyWith<_$ProfileStateStoreImpl> get copyWith =>
      __$$ProfileStateStoreImplCopyWithImpl<_$ProfileStateStoreImpl>(
        this,
        _$identity,
      );
}

abstract class _ProfileStateStore implements ProfileStateStore {
  const factory _ProfileStateStore({
    final bool loading,
    final String errorMessage,
    final JobPosting? jobPosting,
  }) = _$ProfileStateStoreImpl;

  @override
  bool get loading;
  @override
  String get errorMessage;
  @override
  JobPosting? get jobPosting;

  /// Create a copy of ProfileStateStore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileStateStoreImplCopyWith<_$ProfileStateStoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
