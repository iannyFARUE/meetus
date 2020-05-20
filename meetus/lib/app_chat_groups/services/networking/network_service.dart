import 'package:schoolbookapp/app_chat_groups/services/networking/http_service.dart';

abstract class NetworkService {
  HttpService rest;
  NetworkService(this.rest);
}
