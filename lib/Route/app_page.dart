
import 'package:homerental/Route/app_route.dart';
import 'package:homerental/signin.dart';

abstract class AppPages{
  static const initial = "/signin";
  GetPage(
  name:Routes.usersignuppage,
  page:()=>Signin(),
  );
}