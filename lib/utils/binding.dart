import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:home_rent_ird_foundation/state/home/home_state.dart';

BindingsBuilder<dynamic> bindings() {
  return BindingsBuilder(() {
    Get.put(HomeState()); // Put your controller here
  });
}
