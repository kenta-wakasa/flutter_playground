// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    name: json['name'] as String,
    age: json['age'] as int,
    bookList: (json['bookList'] as List<dynamic>)
        ?.map((dynamic e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'bookList': instance.bookList,
    };
