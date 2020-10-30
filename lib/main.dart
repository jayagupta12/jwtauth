import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:jwtauth/utilities/sharedpreference.dart';
import 'package:jwtauth/views/home/home_view.dart';
import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();

  var token=await SharedPreference().getUser();
   bool isTokenExpired=false;
  if(token.toString()!=""){
   isTokenExpired = JwtDecoder.isExpired(token.toString());
  }


  
  await LocatorInjector.setupLocator();
  runApp(MainApplication(isTokenExpired));
}
 // ignore: must_be_immutable
 class MainApplication extends StatelessWidget {
  bool token;
  MainApplication( this.token);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: token?  MaterialApp(
        navigatorKey: locator<NavigatorService>().navigatorKey,
        home: HomeView(),
              ):MaterialApp(
        navigatorKey: locator<NavigatorService>().navigatorKey,
        home: HomeView(),
              ),
            );
          }


        
          
}