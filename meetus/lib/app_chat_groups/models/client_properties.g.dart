// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientProperties _$ClientPropertiesFromJson(Map<String, dynamic> json) {
  return ClientProperties(
    appId: json['appId'] as String,
    applicationName: json['applicationName'] as String,
    applicationDisplayName: json['applicationDisplayName'] as String,
    host: json['host'] as String,
    baseUrl: json['baseUrl'] as String,
    localCountryCode: json['localCountryCode'] as String,
    localCountryIsoCode: json['localCountryIsoCode'] as String,
    sha1FingerprintBase64: json['sha1FingerprintBase64'] as String,
    transactionTimeoutInSeconds: json['transactionTimeoutInSeconds'] as int,
  );
}

Map<String, dynamic> _$ClientPropertiesToJson(ClientProperties instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'applicationName': instance.applicationName,
      'applicationDisplayName': instance.applicationDisplayName,
      'host': instance.host,
      'baseUrl': instance.baseUrl,
      'localCountryCode': instance.localCountryCode,
      'localCountryIsoCode': instance.localCountryIsoCode,
      'sha1FingerprintBase64': instance.sha1FingerprintBase64,
      'transactionTimeoutInSeconds': instance.transactionTimeoutInSeconds,
    };
