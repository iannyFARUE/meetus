import 'package:schoolbookapp/app_chat_groups/models/client_properties.dart';
import 'package:schoolbookapp/configs/file_config_service.dart';
import 'package:schoolbookapp/configs/storage_services.dart';

class ConfigurationService {
  Future<String> getApplicationId() {
    return StorageService.getStringAsync(StorageService.APPLICATION_ID)
        .then((String value) => value);
  }

  void setApplicationId(String applicationId) {
    StorageService.putStringAsync(StorageService.APPLICATION_ID, applicationId);
  }

  Future<String> getApplicationName() {
    return StorageService.getStringAsync(StorageService.APPLICATION_NAME)
        .then((String value) {
      return value;
    });
  }

  Future<String> getUserBearerToken() async {
    return StorageService.getStringAsync(StorageService.USER_TOKEN)
        .then((String value) {
      if (value != null) {
        return 'Bearer $value';
      }
      return null;
    });
  }

  Future<String> getUserToken() async {
    return StorageService.getStringAsync(StorageService.USER_TOKEN)
        .then((String value) => value);
  }

  Future<void> removeUserToken() async {
    return StorageService.removeKeyAsync(StorageService.USER_TOKEN);
  }

  Future<String> getFirebaseInstanceId() {
    return StorageService.getStringAsync(StorageService.FIREBASE_INSTANCE_ID)
        .then((String value) => value);
  }

  ClientProperties readFileConfig() => FileConfigService.appProperties;
}
