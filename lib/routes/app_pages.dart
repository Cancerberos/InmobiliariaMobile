import 'package:get/get.dart';
import '../views/pages/pages.dart';

part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.home,
        page: () => HomePage(),
        transition: Transition.native),
    GetPage(
        name: Routes.avisos,
        page: () => AvisosPage(),
        transition: Transition.native),
    // GetPage(
    //     name: Routes.avisoDetalle,
    //     page: () => AvisoDetallePage(),
    //     transition: Transition.native),
  ];
}
