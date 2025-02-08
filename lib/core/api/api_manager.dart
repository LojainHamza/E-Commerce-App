import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_constants.dart';

class ApiManager{
  final dio = Dio();
/*
https://ecommerce.routemisr.com/api/v1/auth/signup
*/
  Future<Response> getData({required String endPoint, Map<String, dynamic>? queryParameters, Options? options}){
    return dio.get(
        ApiConstants.baseUrl+endPoint,
        queryParameters: queryParameters,
        options: options
    );
  }

  Future<Response> postData({required String endPoint, Map<String, dynamic>? queryParameters, Options? options, Object? body}){
    return dio.post(
        ApiConstants.baseUrl+endPoint,
        data: body,
        queryParameters: queryParameters,
        options: options
    );
  }
}