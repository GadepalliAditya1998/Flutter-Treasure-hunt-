import 'package:jaguar_serializer/jaguar_serializer.dart';

abstract class BaseHttpClient {
  Future<dynamic> getRequest(
      String endPoint, Map<String, dynamic> data, Serializer ofType);
  Future<dynamic> postRequest(String endPoint, dynamic data, Serializer ofType);
  Map<String, dynamic> getHeaders();
}
