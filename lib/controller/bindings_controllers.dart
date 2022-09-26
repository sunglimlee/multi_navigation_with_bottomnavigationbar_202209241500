import 'package:get/get.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/controller/tabitem_controller.dart';

class BindingsControllers extends Bindings {
  @override
  void dependencies() { //
    Get.put(TabItemController(), permanent: true);
  }
  static localBindings1() {} // 추가로 이렇게 static 함수를 사용하면 추가를 할 수 있다.
}