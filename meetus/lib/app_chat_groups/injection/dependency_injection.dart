import 'package:http/http.dart' as http;
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:schoolbookapp/app_auth/services/auth_service.dart';
import 'package:schoolbookapp/app_chat_groups/services/firebase/chat_service.dart';
import 'package:schoolbookapp/app_chat_groups/services/firebase/group_service.dart';
import 'package:schoolbookapp/app_chat_groups/services/firebase/user_service.dart';
import 'package:schoolbookapp/app_chat_groups/services/networking/http_service.dart';
import 'package:schoolbookapp/configs/configuration_service.dart';
import 'package:schoolbookapp/configs/storage_services.dart';
import 'package:schoolbookapp/dummy_login/services/auth.dart';

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((c) => ConfigurationService())
    ..registerFactory((c) => StorageService())
    ..registerFactory((c) => UserService())
    ..registerFactory((c) => GroupService(c.resolve()))
    ..registerFactory((c) => AuthServices())
    ..registerFactory((c) => AuthService())
    ..registerFactory((c) => HttpService(c.resolve()))
    ..registerFactory((c) => ChatService(c.resolve()));
}
