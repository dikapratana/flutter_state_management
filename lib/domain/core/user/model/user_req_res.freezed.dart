// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_req_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserReqRes _$UserReqResFromJson(Map<String, dynamic> json) {
  return RequestData.fromJson(json);
}

/// @nodoc
mixin _$UserReqRes {
  String? get name => throw _privateConstructorUsedError;
  String? get job => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? name, String? job) requestdata,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? name, String? job)? requestdata,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? name, String? job)? requestdata,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestData value) requestdata,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestData value)? requestdata,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestData value)? requestdata,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserReqResCopyWith<UserReqRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReqResCopyWith<$Res> {
  factory $UserReqResCopyWith(
          UserReqRes value, $Res Function(UserReqRes) then) =
      _$UserReqResCopyWithImpl<$Res, UserReqRes>;
  @useResult
  $Res call({String? name, String? job});
}

/// @nodoc
class _$UserReqResCopyWithImpl<$Res, $Val extends UserReqRes>
    implements $UserReqResCopyWith<$Res> {
  _$UserReqResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? job = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestDataCopyWith<$Res>
    implements $UserReqResCopyWith<$Res> {
  factory _$$RequestDataCopyWith(
          _$RequestData value, $Res Function(_$RequestData) then) =
      __$$RequestDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? job});
}

/// @nodoc
class __$$RequestDataCopyWithImpl<$Res>
    extends _$UserReqResCopyWithImpl<$Res, _$RequestData>
    implements _$$RequestDataCopyWith<$Res> {
  __$$RequestDataCopyWithImpl(
      _$RequestData _value, $Res Function(_$RequestData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? job = freezed,
  }) {
    return _then(_$RequestData(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestData with DiagnosticableTreeMixin implements RequestData {
  const _$RequestData({this.name, this.job});

  factory _$RequestData.fromJson(Map<String, dynamic> json) =>
      _$$RequestDataFromJson(json);

  @override
  final String? name;
  @override
  final String? job;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserReqRes.requestdata(name: $name, job: $job)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserReqRes.requestdata'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('job', job));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, job);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestDataCopyWith<_$RequestData> get copyWith =>
      __$$RequestDataCopyWithImpl<_$RequestData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? name, String? job) requestdata,
  }) {
    return requestdata(name, job);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? name, String? job)? requestdata,
  }) {
    return requestdata?.call(name, job);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? name, String? job)? requestdata,
    required TResult orElse(),
  }) {
    if (requestdata != null) {
      return requestdata(name, job);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestData value) requestdata,
  }) {
    return requestdata(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestData value)? requestdata,
  }) {
    return requestdata?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestData value)? requestdata,
    required TResult orElse(),
  }) {
    if (requestdata != null) {
      return requestdata(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestDataToJson(
      this,
    );
  }
}

abstract class RequestData implements UserReqRes {
  const factory RequestData({final String? name, final String? job}) =
      _$RequestData;

  factory RequestData.fromJson(Map<String, dynamic> json) =
      _$RequestData.fromJson;

  @override
  String? get name;
  @override
  String? get job;
  @override
  @JsonKey(ignore: true)
  _$$RequestDataCopyWith<_$RequestData> get copyWith =>
      throw _privateConstructorUsedError;
}
