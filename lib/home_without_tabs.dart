import 'package:flutter/material.dart';

import 'my_tab.dart';

class HomeWithoutTabs extends StatelessWidget {
  const HomeWithoutTabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TabView return-to-top'),
      ),
      body: MyTab(
        index: 1,
        isActive: true,
      ),
    );
  }
}
