// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      photoURL: json['photo_u_r_l'] as String?,
      phoneNumber: json['phone_number'] as String?,
      emailVerified: json['email_verified'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      lastSignInAt: json['last_sign_in_at'] == null
          ? null
          : DateTime.parse(json['last_sign_in_at'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'photo_u_r_l': instance.photoURL,
      'phone_number': instance.phoneNumber,
      'email_verified': instance.emailVerified,
      'created_at': instance.createdAt?.toIso8601String(),
      'last_sign_in_at': instance.lastSignInAt?.toIso8601String(),
    };
