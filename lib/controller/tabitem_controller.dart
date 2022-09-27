import 'dart:developer';

import 'package:get/get.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/util/util.dart';

class TabItemController extends GetxController {
  Rx<TabItem> currentTab = TabItem.red.obs; //

  void selectedTab(TabItem tabItem) {
    if (tabItem == currentTab.value) {
      // pop to first route
      // isFirst 를 통해서 true 가 될때가지 전체
      // 현재 네비게이터의 가장 첫번째 이냐 일때까지 popUntil 해라.
      // 이제 이 글로벌카가 어떻게 참조되는지 봐라.. 너무 간단하다.
      Get.keys[TabItem.values[currentTab.value.index].index]!.currentState!
          .popUntil((route) => route.isFirst);
    } else {
      currentTab(tabItem);
      log(tabItem.toString());
    }
  }
}
