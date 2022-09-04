import 'package:trilling_web/features/auth/domain/entities/appuser.dart';

class AppUserData {
  AppUser? _appUser;



  set appUser (
    AppUser appUser
  )=> _appUser = appUser;

  AppUser get  (){
    return _appUser!;
  }
}
