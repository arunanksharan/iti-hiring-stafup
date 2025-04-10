// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? companyId) fetchJobs,
    required TResult Function(String? companyId) resetAndFetch,
    required TResult Function(String? companyId) nextPage,
    required TResult Function(String? companyId) previousPage,
    required TResult Function(String query) search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? companyId)? fetchJobs,
    TResult? Function(String? companyId)? resetAndFetch,
    TResult? Function(String? companyId)? nextPage,
    TResult? Function(String? companyId)? previousPage,
    TResult? Function(String query)? search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? companyId)? fetchJobs,
    TResult Function(String? companyId)? resetAndFetch,
    TResult Function(String? companyId)? nextPage,
    TResult Function(String? companyId)? previousPage,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchJobs value) fetchJobs,
    required TResult Function(ResetAndFetch value) resetAndFetch,
    required TResult Function(NextPage value) nextPage,
    required TResult Function(PreviousPage value) previousPage,
    required TResult Function(Search value) search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchJobs value)? fetchJobs,
    TResult? Function(ResetAndFetch value)? resetAndFetch,
    TResult? Function(NextPage value)? nextPage,
    TResult? Function(PreviousPage value)? previousPage,
    TResult? Function(Search value)? search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchJobs value)? fetchJobs,
    TResult Function(ResetAndFetch value)? resetAndFetch,
    TResult Function(NextPage value)? nextPage,
    TResult Function(PreviousPage value)? previousPage,
    TResult Function(Search value)? search,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchJobsImplCopyWith<$Res> {
  factory _$$FetchJobsImplCopyWith(
    _$FetchJobsImpl value,
    $Res Function(_$FetchJobsImpl) then,
  ) = __$$FetchJobsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? companyId});
}

/// @nodoc
class __$$FetchJobsImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FetchJobsImpl>
    implements _$$FetchJobsImplCopyWith<$Res> {
  __$$FetchJobsImplCopyWithImpl(
    _$FetchJobsImpl _value,
    $Res Function(_$FetchJobsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? companyId = freezed}) {
    return _then(
      _$FetchJobsImpl(
        freezed == companyId
            ? _value.companyId
            : companyId // ignore: cast_nullable_to_non_nullable
                as String?,
      ),
    );
  }
}

/// @nodoc

class _$FetchJobsImpl implements FetchJobs {
  const _$FetchJobsImpl(this.companyId);

  @override
  final String? companyId;

  @override
  String toString() {
    return 'HomeEvent.fetchJobs(companyId: $companyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchJobsImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, companyId);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchJobsImplCopyWith<_$FetchJobsImpl> get copyWith =>
      __$$FetchJobsImplCopyWithImpl<_$FetchJobsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? companyId) fetchJobs,
    required TResult Function(String? companyId) resetAndFetch,
    required TResult Function(String? companyId) nextPage,
    required TResult Function(String? companyId) previousPage,
    required TResult Function(String query) search,
  }) {
    return fetchJobs(companyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? companyId)? fetchJobs,
    TResult? Function(String? companyId)? resetAndFetch,
    TResult? Function(String? companyId)? nextPage,
    TResult? Function(String? companyId)? previousPage,
    TResult? Function(String query)? search,
  }) {
    return fetchJobs?.call(companyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? companyId)? fetchJobs,
    TResult Function(String? companyId)? resetAndFetch,
    TResult Function(String? companyId)? nextPage,
    TResult Function(String? companyId)? previousPage,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (fetchJobs != null) {
      return fetchJobs(companyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchJobs value) fetchJobs,
    required TResult Function(ResetAndFetch value) resetAndFetch,
    required TResult Function(NextPage value) nextPage,
    required TResult Function(PreviousPage value) previousPage,
    required TResult Function(Search value) search,
  }) {
    return fetchJobs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchJobs value)? fetchJobs,
    TResult? Function(ResetAndFetch value)? resetAndFetch,
    TResult? Function(NextPage value)? nextPage,
    TResult? Function(PreviousPage value)? previousPage,
    TResult? Function(Search value)? search,
  }) {
    return fetchJobs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchJobs value)? fetchJobs,
    TResult Function(ResetAndFetch value)? resetAndFetch,
    TResult Function(NextPage value)? nextPage,
    TResult Function(PreviousPage value)? previousPage,
    TResult Function(Search value)? search,
    required TResult orElse(),
  }) {
    if (fetchJobs != null) {
      return fetchJobs(this);
    }
    return orElse();
  }
}

abstract class FetchJobs implements HomeEvent {
  const factory FetchJobs(final String? companyId) = _$FetchJobsImpl;

  String? get companyId;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchJobsImplCopyWith<_$FetchJobsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetAndFetchImplCopyWith<$Res> {
  factory _$$ResetAndFetchImplCopyWith(
    _$ResetAndFetchImpl value,
    $Res Function(_$ResetAndFetchImpl) then,
  ) = __$$ResetAndFetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? companyId});
}

/// @nodoc
class __$$ResetAndFetchImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$ResetAndFetchImpl>
    implements _$$ResetAndFetchImplCopyWith<$Res> {
  __$$ResetAndFetchImplCopyWithImpl(
    _$ResetAndFetchImpl _value,
    $Res Function(_$ResetAndFetchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? companyId = freezed}) {
    return _then(
      _$ResetAndFetchImpl(
        freezed == companyId
            ? _value.companyId
            : companyId // ignore: cast_nullable_to_non_nullable
                as String?,
      ),
    );
  }
}

/// @nodoc

class _$ResetAndFetchImpl implements ResetAndFetch {
  const _$ResetAndFetchImpl(this.companyId);

  @override
  final String? companyId;

  @override
  String toString() {
    return 'HomeEvent.resetAndFetch(companyId: $companyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetAndFetchImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, companyId);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetAndFetchImplCopyWith<_$ResetAndFetchImpl> get copyWith =>
      __$$ResetAndFetchImplCopyWithImpl<_$ResetAndFetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? companyId) fetchJobs,
    required TResult Function(String? companyId) resetAndFetch,
    required TResult Function(String? companyId) nextPage,
    required TResult Function(String? companyId) previousPage,
    required TResult Function(String query) search,
  }) {
    return resetAndFetch(companyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? companyId)? fetchJobs,
    TResult? Function(String? companyId)? resetAndFetch,
    TResult? Function(String? companyId)? nextPage,
    TResult? Function(String? companyId)? previousPage,
    TResult? Function(String query)? search,
  }) {
    return resetAndFetch?.call(companyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? companyId)? fetchJobs,
    TResult Function(String? companyId)? resetAndFetch,
    TResult Function(String? companyId)? nextPage,
    TResult Function(String? companyId)? previousPage,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (resetAndFetch != null) {
      return resetAndFetch(companyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchJobs value) fetchJobs,
    required TResult Function(ResetAndFetch value) resetAndFetch,
    required TResult Function(NextPage value) nextPage,
    required TResult Function(PreviousPage value) previousPage,
    required TResult Function(Search value) search,
  }) {
    return resetAndFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchJobs value)? fetchJobs,
    TResult? Function(ResetAndFetch value)? resetAndFetch,
    TResult? Function(NextPage value)? nextPage,
    TResult? Function(PreviousPage value)? previousPage,
    TResult? Function(Search value)? search,
  }) {
    return resetAndFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchJobs value)? fetchJobs,
    TResult Function(ResetAndFetch value)? resetAndFetch,
    TResult Function(NextPage value)? nextPage,
    TResult Function(PreviousPage value)? previousPage,
    TResult Function(Search value)? search,
    required TResult orElse(),
  }) {
    if (resetAndFetch != null) {
      return resetAndFetch(this);
    }
    return orElse();
  }
}

abstract class ResetAndFetch implements HomeEvent {
  const factory ResetAndFetch(final String? companyId) = _$ResetAndFetchImpl;

  String? get companyId;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetAndFetchImplCopyWith<_$ResetAndFetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NextPageImplCopyWith<$Res> {
  factory _$$NextPageImplCopyWith(
    _$NextPageImpl value,
    $Res Function(_$NextPageImpl) then,
  ) = __$$NextPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? companyId});
}

/// @nodoc
class __$$NextPageImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$NextPageImpl>
    implements _$$NextPageImplCopyWith<$Res> {
  __$$NextPageImplCopyWithImpl(
    _$NextPageImpl _value,
    $Res Function(_$NextPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? companyId = freezed}) {
    return _then(
      _$NextPageImpl(
        freezed == companyId
            ? _value.companyId
            : companyId // ignore: cast_nullable_to_non_nullable
                as String?,
      ),
    );
  }
}

/// @nodoc

class _$NextPageImpl implements NextPage {
  const _$NextPageImpl([this.companyId]);

  @override
  final String? companyId;

  @override
  String toString() {
    return 'HomeEvent.nextPage(companyId: $companyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextPageImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, companyId);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NextPageImplCopyWith<_$NextPageImpl> get copyWith =>
      __$$NextPageImplCopyWithImpl<_$NextPageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? companyId) fetchJobs,
    required TResult Function(String? companyId) resetAndFetch,
    required TResult Function(String? companyId) nextPage,
    required TResult Function(String? companyId) previousPage,
    required TResult Function(String query) search,
  }) {
    return nextPage(companyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? companyId)? fetchJobs,
    TResult? Function(String? companyId)? resetAndFetch,
    TResult? Function(String? companyId)? nextPage,
    TResult? Function(String? companyId)? previousPage,
    TResult? Function(String query)? search,
  }) {
    return nextPage?.call(companyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? companyId)? fetchJobs,
    TResult Function(String? companyId)? resetAndFetch,
    TResult Function(String? companyId)? nextPage,
    TResult Function(String? companyId)? previousPage,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (nextPage != null) {
      return nextPage(companyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchJobs value) fetchJobs,
    required TResult Function(ResetAndFetch value) resetAndFetch,
    required TResult Function(NextPage value) nextPage,
    required TResult Function(PreviousPage value) previousPage,
    required TResult Function(Search value) search,
  }) {
    return nextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchJobs value)? fetchJobs,
    TResult? Function(ResetAndFetch value)? resetAndFetch,
    TResult? Function(NextPage value)? nextPage,
    TResult? Function(PreviousPage value)? previousPage,
    TResult? Function(Search value)? search,
  }) {
    return nextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchJobs value)? fetchJobs,
    TResult Function(ResetAndFetch value)? resetAndFetch,
    TResult Function(NextPage value)? nextPage,
    TResult Function(PreviousPage value)? previousPage,
    TResult Function(Search value)? search,
    required TResult orElse(),
  }) {
    if (nextPage != null) {
      return nextPage(this);
    }
    return orElse();
  }
}

abstract class NextPage implements HomeEvent {
  const factory NextPage([final String? companyId]) = _$NextPageImpl;

  String? get companyId;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NextPageImplCopyWith<_$NextPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PreviousPageImplCopyWith<$Res> {
  factory _$$PreviousPageImplCopyWith(
    _$PreviousPageImpl value,
    $Res Function(_$PreviousPageImpl) then,
  ) = __$$PreviousPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? companyId});
}

/// @nodoc
class __$$PreviousPageImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$PreviousPageImpl>
    implements _$$PreviousPageImplCopyWith<$Res> {
  __$$PreviousPageImplCopyWithImpl(
    _$PreviousPageImpl _value,
    $Res Function(_$PreviousPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? companyId = freezed}) {
    return _then(
      _$PreviousPageImpl(
        freezed == companyId
            ? _value.companyId
            : companyId // ignore: cast_nullable_to_non_nullable
                as String?,
      ),
    );
  }
}

/// @nodoc

class _$PreviousPageImpl implements PreviousPage {
  const _$PreviousPageImpl([this.companyId]);

  @override
  final String? companyId;

  @override
  String toString() {
    return 'HomeEvent.previousPage(companyId: $companyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviousPageImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, companyId);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviousPageImplCopyWith<_$PreviousPageImpl> get copyWith =>
      __$$PreviousPageImplCopyWithImpl<_$PreviousPageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? companyId) fetchJobs,
    required TResult Function(String? companyId) resetAndFetch,
    required TResult Function(String? companyId) nextPage,
    required TResult Function(String? companyId) previousPage,
    required TResult Function(String query) search,
  }) {
    return previousPage(companyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? companyId)? fetchJobs,
    TResult? Function(String? companyId)? resetAndFetch,
    TResult? Function(String? companyId)? nextPage,
    TResult? Function(String? companyId)? previousPage,
    TResult? Function(String query)? search,
  }) {
    return previousPage?.call(companyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? companyId)? fetchJobs,
    TResult Function(String? companyId)? resetAndFetch,
    TResult Function(String? companyId)? nextPage,
    TResult Function(String? companyId)? previousPage,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (previousPage != null) {
      return previousPage(companyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchJobs value) fetchJobs,
    required TResult Function(ResetAndFetch value) resetAndFetch,
    required TResult Function(NextPage value) nextPage,
    required TResult Function(PreviousPage value) previousPage,
    required TResult Function(Search value) search,
  }) {
    return previousPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchJobs value)? fetchJobs,
    TResult? Function(ResetAndFetch value)? resetAndFetch,
    TResult? Function(NextPage value)? nextPage,
    TResult? Function(PreviousPage value)? previousPage,
    TResult? Function(Search value)? search,
  }) {
    return previousPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchJobs value)? fetchJobs,
    TResult Function(ResetAndFetch value)? resetAndFetch,
    TResult Function(NextPage value)? nextPage,
    TResult Function(PreviousPage value)? previousPage,
    TResult Function(Search value)? search,
    required TResult orElse(),
  }) {
    if (previousPage != null) {
      return previousPage(this);
    }
    return orElse();
  }
}

abstract class PreviousPage implements HomeEvent {
  const factory PreviousPage([final String? companyId]) = _$PreviousPageImpl;

  String? get companyId;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreviousPageImplCopyWith<_$PreviousPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
    _$SearchImpl value,
    $Res Function(_$SearchImpl) then,
  ) = __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
    _$SearchImpl _value,
    $Res Function(_$SearchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null}) {
    return _then(
      _$SearchImpl(
        null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchImpl implements Search {
  const _$SearchImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'HomeEvent.search(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? companyId) fetchJobs,
    required TResult Function(String? companyId) resetAndFetch,
    required TResult Function(String? companyId) nextPage,
    required TResult Function(String? companyId) previousPage,
    required TResult Function(String query) search,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? companyId)? fetchJobs,
    TResult? Function(String? companyId)? resetAndFetch,
    TResult? Function(String? companyId)? nextPage,
    TResult? Function(String? companyId)? previousPage,
    TResult? Function(String query)? search,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? companyId)? fetchJobs,
    TResult Function(String? companyId)? resetAndFetch,
    TResult Function(String? companyId)? nextPage,
    TResult Function(String? companyId)? previousPage,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchJobs value) fetchJobs,
    required TResult Function(ResetAndFetch value) resetAndFetch,
    required TResult Function(NextPage value) nextPage,
    required TResult Function(PreviousPage value) previousPage,
    required TResult Function(Search value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchJobs value)? fetchJobs,
    TResult? Function(ResetAndFetch value)? resetAndFetch,
    TResult? Function(NextPage value)? nextPage,
    TResult? Function(PreviousPage value)? previousPage,
    TResult? Function(Search value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchJobs value)? fetchJobs,
    TResult Function(ResetAndFetch value)? resetAndFetch,
    TResult Function(NextPage value)? nextPage,
    TResult Function(PreviousPage value)? previousPage,
    TResult Function(Search value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class Search implements HomeEvent {
  const factory Search(final String query) = _$SearchImpl;

  String get query;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  HomeStore get store => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeStore store) initial,
    required TResult Function(HomeStore store) loading,
    required TResult Function(HomeStore store) loaded,
    required TResult Function(HomeStore store, String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeStore store)? initial,
    TResult? Function(HomeStore store)? loading,
    TResult? Function(HomeStore store)? loaded,
    TResult? Function(HomeStore store, String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeStore store)? initial,
    TResult Function(HomeStore store)? loading,
    TResult Function(HomeStore store)? loaded,
    TResult Function(HomeStore store, String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({HomeStore store});

  $HomeStoreCopyWith<$Res> get store;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
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
                        as HomeStore,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeStoreCopyWith<$Res> get store {
    return $HomeStoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HomeStore store});

  @override
  $HomeStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$InitialImpl(
        null == store
            ? _value.store
            : store // ignore: cast_nullable_to_non_nullable
                as HomeStore,
      ),
    );
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl(this.store);

  @override
  final HomeStore store;

  @override
  String toString() {
    return 'HomeState.initial(store: $store)';
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

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeStore store) initial,
    required TResult Function(HomeStore store) loading,
    required TResult Function(HomeStore store) loaded,
    required TResult Function(HomeStore store, String message) error,
  }) {
    return initial(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeStore store)? initial,
    TResult? Function(HomeStore store)? loading,
    TResult? Function(HomeStore store)? loaded,
    TResult? Function(HomeStore store, String message)? error,
  }) {
    return initial?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeStore store)? initial,
    TResult Function(HomeStore store)? loading,
    TResult Function(HomeStore store)? loaded,
    TResult Function(HomeStore store, String message)? error,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements HomeState {
  const factory Initial(final HomeStore store) = _$InitialImpl;

  @override
  HomeStore get store;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HomeStore store});

  @override
  $HomeStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$LoadingImpl(
        null == store
            ? _value.store
            : store // ignore: cast_nullable_to_non_nullable
                as HomeStore,
      ),
    );
  }
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl(this.store);

  @override
  final HomeStore store;

  @override
  String toString() {
    return 'HomeState.loading(store: $store)';
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

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeStore store) initial,
    required TResult Function(HomeStore store) loading,
    required TResult Function(HomeStore store) loaded,
    required TResult Function(HomeStore store, String message) error,
  }) {
    return loading(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeStore store)? initial,
    TResult? Function(HomeStore store)? loading,
    TResult? Function(HomeStore store)? loaded,
    TResult? Function(HomeStore store, String message)? error,
  }) {
    return loading?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeStore store)? initial,
    TResult Function(HomeStore store)? loading,
    TResult Function(HomeStore store)? loaded,
    TResult Function(HomeStore store, String message)? error,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements HomeState {
  const factory Loading(final HomeStore store) = _$LoadingImpl;

  @override
  HomeStore get store;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HomeStore store});

  @override
  $HomeStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null}) {
    return _then(
      _$LoadedImpl(
        null == store
            ? _value.store
            : store // ignore: cast_nullable_to_non_nullable
                as HomeStore,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements Loaded {
  const _$LoadedImpl(this.store);

  @override
  final HomeStore store;

  @override
  String toString() {
    return 'HomeState.loaded(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeStore store) initial,
    required TResult Function(HomeStore store) loading,
    required TResult Function(HomeStore store) loaded,
    required TResult Function(HomeStore store, String message) error,
  }) {
    return loaded(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeStore store)? initial,
    TResult? Function(HomeStore store)? loading,
    TResult? Function(HomeStore store)? loaded,
    TResult? Function(HomeStore store, String message)? error,
  }) {
    return loaded?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeStore store)? initial,
    TResult Function(HomeStore store)? loading,
    TResult Function(HomeStore store)? loaded,
    TResult Function(HomeStore store, String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements HomeState {
  const factory Loaded(final HomeStore store) = _$LoadedImpl;

  @override
  HomeStore get store;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HomeStore store, String message});

  @override
  $HomeStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? store = null, Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == store
            ? _value.store
            : store // ignore: cast_nullable_to_non_nullable
                as HomeStore,
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.store, this.message);

  @override
  final HomeStore store;
  @override
  final String message;

  @override
  String toString() {
    return 'HomeState.error(store: $store, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store, message);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeStore store) initial,
    required TResult Function(HomeStore store) loading,
    required TResult Function(HomeStore store) loaded,
    required TResult Function(HomeStore store, String message) error,
  }) {
    return error(store, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeStore store)? initial,
    TResult? Function(HomeStore store)? loading,
    TResult? Function(HomeStore store)? loaded,
    TResult? Function(HomeStore store, String message)? error,
  }) {
    return error?.call(store, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeStore store)? initial,
    TResult Function(HomeStore store)? loading,
    TResult Function(HomeStore store)? loaded,
    TResult Function(HomeStore store, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(store, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements HomeState {
  const factory Error(final HomeStore store, final String message) =
      _$ErrorImpl;

  @override
  HomeStore get store;
  String get message;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeStore {
  List<Item> get items => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get searchTerm => throw _privateConstructorUsedError;

  /// Create a copy of HomeStore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStoreCopyWith<HomeStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStoreCopyWith<$Res> {
  factory $HomeStoreCopyWith(HomeStore value, $Res Function(HomeStore) then) =
      _$HomeStoreCopyWithImpl<$Res, HomeStore>;
  @useResult
  $Res call({
    List<Item> items,
    int currentPage,
    int pageSize,
    int totalItems,
    bool loading,
    String? searchTerm,
  });
}

/// @nodoc
class _$HomeStoreCopyWithImpl<$Res, $Val extends HomeStore>
    implements $HomeStoreCopyWith<$Res> {
  _$HomeStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeStore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? currentPage = null,
    Object? pageSize = null,
    Object? totalItems = null,
    Object? loading = null,
    Object? searchTerm = freezed,
  }) {
    return _then(
      _value.copyWith(
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<Item>,
            currentPage:
                null == currentPage
                    ? _value.currentPage
                    : currentPage // ignore: cast_nullable_to_non_nullable
                        as int,
            pageSize:
                null == pageSize
                    ? _value.pageSize
                    : pageSize // ignore: cast_nullable_to_non_nullable
                        as int,
            totalItems:
                null == totalItems
                    ? _value.totalItems
                    : totalItems // ignore: cast_nullable_to_non_nullable
                        as int,
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            searchTerm:
                freezed == searchTerm
                    ? _value.searchTerm
                    : searchTerm // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeStoreImplCopyWith<$Res>
    implements $HomeStoreCopyWith<$Res> {
  factory _$$HomeStoreImplCopyWith(
    _$HomeStoreImpl value,
    $Res Function(_$HomeStoreImpl) then,
  ) = __$$HomeStoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Item> items,
    int currentPage,
    int pageSize,
    int totalItems,
    bool loading,
    String? searchTerm,
  });
}

/// @nodoc
class __$$HomeStoreImplCopyWithImpl<$Res>
    extends _$HomeStoreCopyWithImpl<$Res, _$HomeStoreImpl>
    implements _$$HomeStoreImplCopyWith<$Res> {
  __$$HomeStoreImplCopyWithImpl(
    _$HomeStoreImpl _value,
    $Res Function(_$HomeStoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeStore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? currentPage = null,
    Object? pageSize = null,
    Object? totalItems = null,
    Object? loading = null,
    Object? searchTerm = freezed,
  }) {
    return _then(
      _$HomeStoreImpl(
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<Item>,
        currentPage:
            null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                    as int,
        pageSize:
            null == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                    as int,
        totalItems:
            null == totalItems
                ? _value.totalItems
                : totalItems // ignore: cast_nullable_to_non_nullable
                    as int,
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        searchTerm:
            freezed == searchTerm
                ? _value.searchTerm
                : searchTerm // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStoreImpl implements _HomeStore {
  const _$HomeStoreImpl({
    final List<Item> items = const [],
    this.currentPage = 1,
    this.pageSize = 50,
    this.totalItems = 0,
    this.loading = false,
    this.searchTerm,
  }) : _items = items;

  final List<Item> _items;
  @override
  @JsonKey()
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final int totalItems;
  @override
  @JsonKey()
  final bool loading;
  @override
  final String? searchTerm;

  @override
  String toString() {
    return 'HomeStore(items: $items, currentPage: $currentPage, pageSize: $pageSize, totalItems: $totalItems, loading: $loading, searchTerm: $searchTerm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStoreImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    currentPage,
    pageSize,
    totalItems,
    loading,
    searchTerm,
  );

  /// Create a copy of HomeStore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStoreImplCopyWith<_$HomeStoreImpl> get copyWith =>
      __$$HomeStoreImplCopyWithImpl<_$HomeStoreImpl>(this, _$identity);
}

abstract class _HomeStore implements HomeStore {
  const factory _HomeStore({
    final List<Item> items,
    final int currentPage,
    final int pageSize,
    final int totalItems,
    final bool loading,
    final String? searchTerm,
  }) = _$HomeStoreImpl;

  @override
  List<Item> get items;
  @override
  int get currentPage;
  @override
  int get pageSize;
  @override
  int get totalItems;
  @override
  bool get loading;
  @override
  String? get searchTerm;

  /// Create a copy of HomeStore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStoreImplCopyWith<_$HomeStoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
