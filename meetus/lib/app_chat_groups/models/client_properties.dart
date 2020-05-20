import 'package:json_annotation/json_annotation.dart';

part 'client_properties.g.dart';

@JsonSerializable()
class ClientProperties {
  String appId;
  String applicationName;
  String applicationDisplayName;
  String host;
  String baseUrl;
  String localCountryCode;
  String localCountryIsoCode;
  String sha1FingerprintBase64;
  int transactionTimeoutInSeconds;

  ClientProperties(
      {this.appId,
      this.applicationName,
      this.applicationDisplayName,
      this.host,
      this.baseUrl,
      this.localCountryCode,
      this.localCountryIsoCode,
      this.sha1FingerprintBase64,
      this.transactionTimeoutInSeconds = 30});

  factory ClientProperties.fromJson(Map<String, dynamic> json) =>
      _$ClientPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$ClientPropertiesToJson(this);
}
