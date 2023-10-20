import 'dart:developer';

import 'package:dio/dio.dart';

class HttpManager {
  late final Dio _dio;

  HttpManager() {
    _dio = Dio();
  }

  Future<Map> restRequest({
    required String url,
    required String method,
    Map? headers,
    dynamic body,
  }) async {
    Map<String, dynamic> defaultHeaders = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    try {
      Response result = await _dio.request(
        url,
        options: Options(
          method: method,
          headers: defaultHeaders,
        ),
        data: body,
      );

      //Retorno do backend
      return result.data;
    } on DioException catch (e) {
      //Erro do Dio request
      log("Dio Exception");
      log(e.error.toString());
      log(e.response?.data.toString() ?? 'Sem resposta...');
      if (e.response?.data != null) {
        if (e.response!.data.toString().contains("html")) {
          return {'error': 'Server error...'};
        }
      } else {
        return {"error": "CONNECTION"};
      }
      return e.response?.data ?? {};
    } catch (e) {
      //Erro generalizado
      return {};
    }
  }
}
