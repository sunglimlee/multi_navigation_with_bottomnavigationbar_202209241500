import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/controller/tabitem_controller.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/util/util.dart';

class BottomNavigation extends GetView<TabItemController> {
  // 현재탭바(currentTab) 과 선택했을 때 실행될 콜백함수(onSelectTab) 이 필요하다.
  // 여기가 아규먼트이고
  const BottomNavigation(this.onSelectTab, {this.key}) : super(key: key); // 현재 설정값 vs 선택한 값
  @override
  final Key? key;   // TODO
  // 그래서 그 값들을 각각 받고
  final void Function(TabItem tabitem) onSelectTab;   // 콜백함수

  @override
  Widget build(BuildContext context) {
    return Obx (() =>
    BottomNavigationBar( // 이제 BottomNavigation 을 만든다.
      key: key, // 키가 필요했었나?
      type: BottomNavigationBarType.fixed, // width 즉 가로가 정해져 있다는 뜻
      items: [ // BottomNavigationBarItem 을 넣기 위한 부분
        _buildItem(TabItem.red), // 아이템을 세가지로 만든이유는 동시에 존재해야 하기때문에
        _buildItem(TabItem.blue),
        _buildItem(TabItem.green),
      ],
      onTap: (index) => onSelectTab( // 현재탭을 넘겨주는 거지
        TabItem.values[index], // 야! 이걸 몰라서 찾아봤었는데 enum values[index] 로 한다고? // QnADartGrammar
      ),

      currentIndex: controller.currentTab.value.index, // 야! 이것도 index 를 이용했구나. // QnADartGrammar
      selectedItemColor: activeTabColor[controller.currentTab.value]!, // 여기 보이지 Map 함수 사용하고 있는거 // QnADartGrammar
    ));
    // 누를때마다 값이 바뀐다. 그말은 계속 새롭게 만들어진다는 뜻이고.. 그래서 이 객체를 만들때 현재값과 선택한 값을 받아서 다시 그려주는거구나.
    //print("BottomNavigationStateful 의 값은 ${bN.hashCode} 입니다.");
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.layers, // 그렇구나. layers 를 사용하고 있구나. 괜찮은 아이디어다.
        color: _colorTabMatching(tabItem),
      ),
      label: tabName[tabItem],
    );
  }

  Color _colorTabMatching(TabItem item) {
    return controller.currentTab.value == item ? activeTabColor[item]! : Colors.grey; // 이것도 아주 괞찮은 방법이다. 필요없는 것들은 Colors.grey 로 처리한다.
  }
}
