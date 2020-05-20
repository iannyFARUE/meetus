import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:schoolbookapp/app_chat_groups/services/networking/http_service_response.dart';
import 'package:schoolbookapp/configs/configuration_service.dart';
import 'package:schoolbookapp/utils/strings.dart';

class HttpService {
  ConfigurationService _configService;

  HttpService(this._configService);

  Future<MappedNetworkServiceResponse<T>> getAsync<T>(String url,
      {Map<String, String> headers,
      Map<String, String> params,
      int timeout = 30}) async {
    //headers = await constructDefaultRoleoHeaders(headers);
    logRequest(url, "GET", params, headers, timeout, "null");
    try {
      Response response = await http
          .get(constructRequestUri(url, params), headers: headers)
          .timeout(Duration(seconds: timeout))
          .then((http.Response response) => response);
      logResponse(response);
      return processResponse<T>(response);
    } catch (exception) {
      print(exception);
      return processErrorResponse<T>(exception);
    }
  }

  MappedNetworkServiceResponse<T> processResponse<T>(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      return processRoleoResponse(response);
    } else {
      String message = Strings.GENERIC_ERROR_MESSAGE;
      if (response.statusCode == 500 ||
          response.statusCode == 401 ||
          response.statusCode == 400) {
        debugPrint("RESPONSE_EXCEPTION ${response.body}");
        final Map<String, Object> jsonData = json.decode(response.body);

        if (jsonData != null && jsonData.containsKey("error")) {
          final Map<String, Object> err = jsonData["error"];
          message = err["message"];
        }
        if (message == null) {
          message = Strings.GENERIC_ERROR_MESSAGE;
        }
      }
      return new MappedNetworkServiceResponse<T>(
          networkServiceResponse: new NetworkServiceResponse<T>(
              success: false,
              message: message,
              statusCode: response.statusCode));
    }
  }

  MappedNetworkServiceResponse<T> processRoleoResponse<T>(
      http.Response response) {
    var jsonResult = response.body;
    dynamic resultClass;
    if (jsonResult != null &&
        jsonResult.isNotEmpty &&
        jsonResult.toString() != "") {
      resultClass = jsonDecode(jsonResult);
    } else {
      resultClass = null;
    }

    return new MappedNetworkServiceResponse<T>(
        mappedResult: resultClass,
        networkServiceResponse: new NetworkServiceResponse<T>(success: true));
  }

  MappedNetworkServiceResponse<T> processErrorResponse<T>(exception) {
    String message = Strings.NETWORK_ERROR_MESSAGE;
    if (exception is HandshakeException) {
      message = Strings.SSL_ERROR_MESSAGE;
    } else if (exception is TimeoutException) {
      message = Strings.NETWORK_TIMEOUT_MESSAGE;
    }
    return new MappedNetworkServiceResponse<T>(
        networkServiceResponse: new NetworkServiceResponse<T>(
            success: false, message: message, statusCode: 503));
  }

  Uri constructRequestUri(String url, Map<String, String> params) {
    String endPoint = _configService.readFileConfig().baseUrl + url;
    if (params == null) {
      params = new Map<String, String>();
    }
    return Uri.http(_configService.readFileConfig().host, endPoint, params);
  }

  Future<MappedNetworkServiceResponse<T>> postAsync<T>(String url,
      {Map<String, String> headers,
      Map<String, String> params,
      dynamic body,
      int timeout = 30}) async {
    // headers = await constructDefaultRoleoHeaders(headers);
    Object content = json.encoder.convert(body);
    logRequest(url, "POST", params, headers, timeout, content);
    try {
      Response response = await http
          .post(constructRequestUri(url, params),
              body: content, headers: headers)
          .timeout(Duration(seconds: timeout))
          .then((http.Response response) => response);
      logResponse(response);
      return processResponse<T>(response);
    } catch (exception) {
      print(exception);
      return processErrorResponse<T>(exception);
    }
  }

  //   void logRequest(String url, String method, Map<String, String> queryParams, Map<String, String> headers, int timeout, Object body) {
  //   debugPrint("");
  //   debugPrint("******REQUEST********");
  //   debugPrint("URL: " + url);
  //   debugPrint("Method: " + method);
  //   debugPrint("QueryParams: " + queryParams.toString());
  //   debugPrint("Headers: " + headers.toString());
  //   debugPrint("Timeout: " + timeout.toString());
  //   debugPrint("Body: " + body);
  //   debugPrint("*******REQUEST END**********");
  //   debugPrint("");
  // }

  // void logResponse(Response response) {
  //   debugPrint("");
  //   debugPrint("******RESPONSE********");
  //   debugPrint("Status: ${response.statusCode}");
  //   debugPrint("Body: ${response.body}");
  //   debugPrint("Headers:" + response.headers.toString());
  //   debugPrint("*******RESPONSE END**********");
  //   debugPrint("");
  // }

  Future<Map<String, String>> constructDefaultRoleoHeaders(
      Map<String, String> headers) async {
    if (headers == null) {
      headers = new Map<String, String>();
    }

    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('Content-Type', () => 'application/json');
    String token = await ConfigurationService().getUserBearerToken();
    if (token != null) {
      headers.putIfAbsent('Authorization', () => token);
    }

    return headers;
  }

  void logRequest(String url, String method, Map<String, String> queryParams,
      Map<String, String> headers, int timeout, Object body) {
    debugPrint("");
    debugPrint("******REQUEST********");
    debugPrint("URL: " + url);
    debugPrint("Method: " + method);
    debugPrint("QueryParams: " + queryParams.toString());
    debugPrint("Headers: " + headers.toString());
    debugPrint("Timeout: " + timeout.toString());
    debugPrint("Body: " + body);
    debugPrint("*******REQUEST END**********");
    debugPrint("");
  }

  void logResponse(Response response) {
    debugPrint("");
    debugPrint("******RESPONSE********");
    debugPrint("Status: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    debugPrint("Headers:" + response.headers.toString());
    debugPrint("*******RESPONSE END**********");
    debugPrint("");
  }
}
