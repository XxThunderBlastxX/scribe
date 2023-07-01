// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uid: json['uid'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      profileUrl: json['profileUrl'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'email': instance.email,
      'profileUrl': instance.profileUrl,
    };
