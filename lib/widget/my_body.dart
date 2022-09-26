import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/controller/tabitem_controller.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/util/util.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/widget/color_detail.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/widget/color_list.dart';

class MyBody extends GetView<TabItemController> {
  MyBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) { //
    //print('테이터의 값은 ${controller.currentTab.value.index} 입니다.');
    return Obx(() =>
      WillPopScope(
        onWillPop: () async { // pop 할때 일단
          final isFirstRouteInCurrentTab =
          // 현재 GlobalKey 를 가진 Navigator 의 NavigateState 가 pop 이가능하나? (maybePop)
          // true 를 리턴하면 첫번째 페이지가 아니라는 거지.. 그래서 ! 느낌표를 넣은거고
          // 여기서부터 다시하자. GlobalKey 를 어떻게 설정하는지 알아야 한다.
          !await Get.keys[controller.currentTab.value.index]!.currentState!.maybePop();
          // pop 이 가능하지 않아서 즉 첫번째 페이지라서 ifFirstRouteInCurrentTab 이 true 라면
          if (isFirstRouteInCurrentTab) {
            // if not on the 'main' tab
            // 빨간탭이 아니라면 빨간탭으로 보내고
            if (controller.currentTab != TabItem.red) {
              // select 'main' tab
              controller.currentTab(TabItem.red);
              // back button handled by app
              return false; // 여기서 false 가 리턴되는 뜻은 WillPopScope 을 실행하지 말라는뜻
              // Flutter WillPopScope class 설명에도 나와 있듯이 true 면 ModalRoute 를 종료하겠다는 뜻
            }
          }
          //
          // let system handle back button if we're on the first route
          // 만약에 true 라면 이제는 시스템에 제어권을 넘겨서 ModalRoute 를 종료하겠다는 거지.
          return isFirstRouteInCurrentTab;
          },
        child: IndexedStack(
            index: controller.currentTab.value.index,
            children: [
              IndexedStackNavigator(TabItem.red),
              IndexedStackNavigator(TabItem.blue),
              IndexedStackNavigator(TabItem.green),
            ],
          ),
      ),
    );
  }
}

// 이렇게 Routes 를 만들어야 한다. 그냥 일반 클래스이다.
class IndexedStackNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class IndexedStackNavigator extends GetView<TabItemController> {
  IndexedStackNavigator(this.tabItem, {Key? key}) : super(key: key);
  TabItem tabItem;

/*
  final _navigatorKeys = { // 이것도 맵으로 만들어놨고
    TabItem.red: GlobalKey<NavigatorState>(),
    TabItem.green: GlobalKey<NavigatorState>(),
    TabItem.blue: GlobalKey<NavigatorState>(),
  };
*/

  @override
  Widget build(BuildContext context) {
    var routeBuilder = _routeBuilder();
    //var t = tabName[tabItem];
    // 맨첫페이지가 만들어지는거니깐.
    return Navigator(
      key: Get.nestedKey(TabItem.values[tabItem.index].index),
      //key:_navigatorKeys[controller.currentTab],
      initialRoute: IndexedStackNavigatorRoutes.root,
      onGenerateRoute: (routeSetting) {
        // switch 가 의미가 없네.
        switch (routeSetting.name) {
          case IndexedStackNavigatorRoutes.root:
            return GetPageRoute(page: () {
              // 일단 함수잖아. 그러면 함수를 실행시켜서 값을 받아와야하지?
              return routeBuilder[routeSetting.name!]!;
            });
        }
      },
    );
  }

  Map<String, Widget> _routeBuilder({int matrixIndex = 500}) {
    return {
      IndexedStackNavigatorRoutes.root: ColorsList(pushToColorDetail),
      IndexedStackNavigatorRoutes.detail: ColorDetail(
          color: activeTabColor[tabItem]!, title: tabName[tabItem]!, materialIndex: matrixIndex),
    };
  }

  // 이부분은 해도 해도 헷갈린다.
  void pushToColorDetail(int matrixIndex) {
    //print('클릭되었니?');
    var routeBuilder = _routeBuilder(matrixIndex: matrixIndex);
    Get.to(routeBuilder['/detail'], id: TabItem.values[tabItem.index].index);
  }
}
