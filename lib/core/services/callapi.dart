import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:jwtauth/apiurl.dart';
import 'package:jwtauth/core/base/base_service.dart';
import 'package:jwtauth/core/models/loginresponse.dart';
import 'package:jwtauth/utilities/httpinterceptor.dart';


class ApiService extends BaseService {
  Dio dio = new Dio();
  ApiService() {
    initializeDio();
  }

  void initializeDio() {
    dio.interceptors.add(DioCacheManager(CacheConfig(
      baseUrl: BASE_URL,
      defaultMaxAge: Duration(minutes: 5),
    )).interceptor);

    dio.interceptors.add(LoggingInterceptors());
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
