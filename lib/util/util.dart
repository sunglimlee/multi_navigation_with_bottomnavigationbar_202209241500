import 'package:flutter/material.dart';

enum TabItem { red, blue, green } // 컬러 팔레트를 위한 색상 선택 enum

/*
1. 이 클래스를 함수로 만들고 싶은데 그러면 그냥 그 함수별로 나오는 값들을 다르게 할 수 있다.
2. 만약 지금처럼 클래스로 만들어서 static 으로 간다면 이 값들을 모두에세서 공유하는게 되잖아..
3. 근데 다시 이렇게 값들을 일반 클래스로 만들면 이 값들을 계속 고유한 곳에 보관할게 할 수 있다.
 */
const Map<TabItem, String> tabName = {
  TabItem.red : 'RED',
  TabItem.blue : 'BLUE',
  TabItem.green : 'GREEN'
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.red: Colors.red,
  TabItem.blue: Colors.blue,
  TabItem.green : Colors.green
};


