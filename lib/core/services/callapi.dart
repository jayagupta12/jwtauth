import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:jwtauth/apiurl.dart';
import 'package:jwtauth/core/base/base_service.dart';
import 'package:jwtauth/core/models/loginresponse.dart';
import 'package:jwtauth/utilities/httpinterceptor.dart';


class ApiService extends BaseService {
  Dio dio ;
  ApiService() {
    dio= new Dio()
    ..options.baseUrl=BASE_URL;
    initializeDio();// karu
  }

  void initializeDio() {
  // dio.options=BaseOptions(baseUrl: "http://192.168.1.12:5000");
    //var token=SharedPreference().getUser(); //get the token from shared pref
    dio.interceptors.add(DioCacheManager(CacheConfig(
      baseUrl: BASE_URL,
      defaultMaxAge: Duration(minutes: 5),
    )).interceptor);

    dio.interceptors.add(LoggingInterceptors());

    // dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
    //   // Do something before request is sent
    //   options.headers["Authorization"] = "Bearer " + token.toString();
    //   return options;
    // },onResponse:(Response response) {
    //     // Do something with response data
    //     return response; // continue
    // }));
  }
  

getLoginResponse(String email,String password) async{
  Map<String,String> body={
    "email":email,
    "pass":password
  };

  try{Response<String> response = await dio.post(login,data:body);
      print("url  "+login);
      print(response.data);
      return loginResponseFromJson(response.data);

  }catch(e){
 
  }
}
}
