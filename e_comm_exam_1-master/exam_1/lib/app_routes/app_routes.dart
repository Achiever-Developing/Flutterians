import 'package:exam_1/headers.dart';

class AppRoutes {
  static String splashscreen = "/";
  static String homepage = "home_page";
  static String detailpage = "detail_page";
  static String cartpage = "cartpage";

  static Map<String, WidgetBuilder> route = {
    splashscreen: (context) => const SplashScreen(),
    homepage: (context) => const HomePage(),
    detailpage: (context) => const DetailPage(),
    cartpage: (context) => const CartPage()
  };
}
