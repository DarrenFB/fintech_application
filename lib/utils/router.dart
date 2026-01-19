import 'package:fintech_application/screens/home_screen.dart';
import 'package:fintech_application/bindings/data_binding.dart';
import 'package:get/get.dart';

final List<GetPage> appScreens = [
  GetPage(
    name: '/home',
    page: () => HomeScreen(),
    binding: DataBinding(),
  ),
];