import 'package:schoolbookapp/app_chat_groups/models/client_properties.dart';

class Config {
  static final String host = 'schoolbook.co.zw';
  static final String baseUrl = 'app/api';
  static final String applicationId = 'schoolbook-app';
  static final String applicationName = 'School Book';
  static final String applicationDisplayName = 'School Book';

  static ClientProperties appProperties() {
    return ClientProperties(
        appId: applicationId,
        baseUrl: baseUrl,
        host: host,
        applicationName: applicationName,
        applicationDisplayName: applicationDisplayName);
  }
}
