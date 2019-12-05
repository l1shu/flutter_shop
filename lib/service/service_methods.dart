import 'dart:convert';

import 'package:dio/dio.dart';
import '../config.dart';

Future getDataFromApi(String url, {dynamic data}) async {
  print('开始接口请求：$url');
  try {
    Dio dio = Dio(BaseOptions(
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json
    ));
    
    Response res = await dio.post(servicePath[url], data: data);
    if (res.statusCode == 200) {
      return json.decode(res.data);
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>$e');
  }
}