import 'package:jwtauth/core/base/base_view_model.dart';
import 'package:jwtauth/core/locator.dart';
import 'package:jwtauth/core/models/loginresponse.dart';
import 'package:jwtauth/core/services/callapi.dart';
import 'package:jwtauth/utilities/sharedpreference.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel();
  final ApiService _api = locator<ApiService>();
    LoginResponse loginResponse=new LoginResponse();
    SharedPreference sharedPreference=new SharedPreference();
  // Add ViewModel specific code here
  Future loginUser(String email,String password) async {
    busy = true;
    
  
      var response = await _api.getLoginResponse(email,password);
      print(response);
      if(response!= null){
      if(response is LoginResponse){
        loginResponse=response;
        print(loginResponse.responsetoken);
        sharedPreference.setUser(loginResponse.responsetoken);
      }
  }
    busy = false;
  }
  // Add ViewModel specific code here
}