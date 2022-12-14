import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/controller/tabitem_controller.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/util/util.dart';

class ColorsList extends GetView<TabItemController> {
  ColorsList(this.onPush, {Key? key}) : super(key: key); // callback 함수 받았고
  final ValueChanged<int>? onPush; // callback function
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      Scaffold(
          appBar: AppBar(
            title: Text(tabName[controller.currentTab.value]!,
            ),
            backgroundColor: activeTabColor[controller.currentTab.value],
          ),
          body: Container(
            color: Colors.white,
            child: _buildList(activeTabColor[controller.currentTab.value]!),
          )),
    );
  }

  final List<int> materialIndices = [ // List 사용방법 QnADartGrammar
    900,
    800,
    700,
    600,
    500,
    400,
    300,
    200,
    100,
    50
  ];

  Widget _buildList(MaterialColor color) { //
    return ListView.builder(
        itemCount: materialIndices.length, // 아이템 전체 갯수를 기준으로
        itemBuilder: (BuildContext content, int index) { // 리스트의 아이템을 만드는데 각 인덱스에 따라서
          int materialIndex = materialIndices[index]; // 해당 인덱스를 임시변수로 가져와서
          return Container( // 컨테이너 안에
            color: color[materialIndex],
            child: ListTile( // 리스트타일을 만들건데
              title: Text('$materialIndex', style: TextStyle(fontSize: 24.0)), // 타이틀을 정해놓고
              trailing: Icon(Icons.chevron_right), // 아이콘을 넣어주고
              // 그냥 onPush?(materialIndex) 라고 해도 될텐데 왜 이렇게 call 을 사용했을까?
              // [question] The method 'call' can't be unconditionally invoked because the receiver can be 'null'.
              // [answer] onPush? not onPUsh only
              onTap: () => onPush?.call(materialIndex), // 해당 인덱스를 이용해서 콜백함수를 실행시킬 거다.
            ),
          );
        });
  }
}
