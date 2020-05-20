import 'package:schoolbookapp/app_chat_groups/models/client_properties.dart';

class FileConfigService {
  static ClientProperties appProperties;

  void registerConfig(ClientProperties configProperties) {
    appProperties = configProperties;
  }
}
