import 'dart:io';

import 'package:dio/dio.dart';
import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  final dio = Dio();

  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response = await dio
          .post(
            url,
            options: Options(
              responseType: ResponseType.json,
              validateStatus: (statusCode) {
                return true;
              },
            ),
          )
          .timeout(const Duration(seconds: 60));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 400:
        dynamic responseJson = response.data;
        return responseJson;
      case 401:
        dynamic responseJson = response.data;
        return responseJson;
      case 404:
        return response.data;
      case 500:
        return response.data;
      default:
        throw FetchDataException(
            'Error accoured while communicating with server ${response.statusCode}');
    }
  }

}
