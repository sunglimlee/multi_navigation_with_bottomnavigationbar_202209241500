
import 'dart:developer';

import 'package:get/get.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/util/util.dart';

class TabItemController extends GetxController {
  Rx<TabItem> currentTab = TabItem.red.obs; //

  void selectedTab(TabItem tabItem) {
    currentTab(tabItem);
    log(tabItem.toString());
  }

}