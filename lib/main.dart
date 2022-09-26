import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/controller/bindings_controllers.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/controller/tabitem_controller.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/widget/my_body.dart';
import 'package:multi_navigation_with_bottomnavigationbar_202209241500/util/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsControllers(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends GetView<TabItemController> {
  const MyHomePage({this.title, Key? key}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(),
      // 여기가 파라미터잖아.
      bottomNavigationBar: BottomNavigation(controller.selectedTab),
    );
  }
}
