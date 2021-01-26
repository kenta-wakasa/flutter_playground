// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(
      {@required String name,
      @required int age,
      @required List<String> bookList}) {
    return _User(
      name: name,
      age: age,
      bookList: bookList,
    );
  }

// ignore: unused_element
  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get name;
  int get age;
  List<String> get bookList;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({String name, int age, List<String> bookList});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object name = freezed,
    Object age = freezed,
    Object bookList = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      age: age == freezed ? _value.age : age as int,
      bookList:
          bookList == freezed ? _value.bookList : bookList as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call({String name, int age, List<String> bookList});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object name = freezed,
    Object age = freezed,
    Object bookList = freezed,
  }) {
    return _then(_User(
      name: name == freezed ? _value.name : name as String,
      age: age == freezed ? _value.age : age as int,
      bookList:
          bookList == freezed ? _value.bookList : bookList as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {@required this.name, @required this.age, @required this.bookList})
      : assert(name != null),
        assert(age != null),
        assert(bookList != null);

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String name;
  @override
  final int age;
  @override
  final List<String> bookList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(name: $name, age: $age, bookList: $bookList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('bookList', bookList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.bookList, bookList) ||
                const DeepCollectionEquality()
                    .equals(other.bookList, bookList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(bookList);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {@required String name,
      @required int age,
      @required List<String> bookList}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get name;
  @override
  int get age;
  @override
  List<String> get bookList;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith;
}
