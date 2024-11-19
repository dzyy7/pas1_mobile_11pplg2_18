import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_18/controller/dashboard_controller.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Dashboardcontroller() );

}
}