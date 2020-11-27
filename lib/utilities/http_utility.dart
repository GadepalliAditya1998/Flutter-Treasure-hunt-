import 'package:dio/dio.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:keka_hunt/abstracts/base_http.dart';

class HttpUtility extends BaseHttpClient {
  String _baseUrl = "https://kekathunt.azurewebsites.net/api";
  static const String userDetails = "user";

  final Dio dio = Dio();

  @override
  Future<dynamic> getRequest(
      String endPoint, Map<String, dynamic> data, Serializer ofType,
      {bool isList = false}) async {
    var url = "$_baseUrl/$endPoint";
    print(url);
    Response response = await dio.get(
      url,
      queryParameters: data,
      options: Options(
        headers: getHeaders(),
      ),
    );
    try {
      if (response != null) {
        Serializer _deserializer = ofType;
        if (isList) {
          List<dynamic> result =
              _deserializer.fromList(List.from(response.data));

          return result;
        } else {
          Map map = response.data as Map;
          return _deserializer.fromMap(map);
        }
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  @override
  Future<dynamic> postRequest(String endPoint, dynamic data, Serializer ofType,
      {bool isList = false}) async {
    print(data);
    var url = "$_baseUrl/$endPoint";

    print(url);
    try {
      Response response = await dio.post(
        "$_baseUrl/$endPoint",
        data: data,
        options: Options(
          headers: getHeaders(),
        ),
      );
      if (response != null) {
        Serializer _deserializer = ofType;
        print("Response:" + response.data.toString());

        if (isList) {
          List<dynamic> result = _deserializer.fromList(response.data).toList();

          return result;
        } else {
          Map map = response.data as Map;
          return _deserializer.fromMap(map);
        }
      }
    } catch (e, s) {
      print("Some exception is thrown");
      print(ofType);
      print(e);
      print(s);
    }
    return null;
  }

  @override
  Map<String, dynamic> getHeaders() {
    return {"Accept": "application/json", 'Content-Type': 'application/json'};
  }
}
