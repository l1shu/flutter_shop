import 'dart:convert';

import 'package:dio/dio.dart';
import '../config.dart';

Future getHomePageContent() async {
  try {
    Dio dio = Dio(BaseOptions(
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json
    ));
    Map<String, String> formData = {'lon':'115.02932','lat':'35.76189'};
    Response res = await dio.post(servicePath['homePageContext'], data:formData);
    if (res.statusCode == 200) {
      return json.decode(res.data);
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>$e');
  }
}