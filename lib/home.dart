import 'package:flutter/material.dart';
import 'package:tabviewer_return_to_top/utils.dart';

import 'my_tab.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

const int _tabsLength = 4;

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController ctrl;
  int activeTab;
  @override
  void initState() {
    super.initState();
    activeTab = 0;
    ctrl = TabController(
      vsync: this,
      length: _tabsLength,
      initialIndex: activeTab,
    );
    ctrl.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (activeTab != ctrl.index) {
      pfCb(() => setState(() {
            activeTab = ctrl.index;
            print('active tab changed to $activeTab');
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      for (int i = 0; i < _tabsLength; i++)
        MyTab(
          key: ValueKey<int>(i),
          index: i,
          isActive: activeTab == i,
        )
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TabView return-to-top'),
        bottom: TabBar(
          controller: ctrl,
          tabs: [
            Text('tab 0'),
            Text('tab 1'),
            Text('tab 2'),
            Text('tab 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: ctrl,
        children: tabs,
      ),
    );
  }
}
