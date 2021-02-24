import 'package:flutter/material.dart';
import 'package:tabviewer_return_to_top/utils.dart';

import 'my_box.dart';

class MyTab extends StatefulWidget {
  final int index;
  final bool isActive;

  const MyTab({Key key, this.index, this.isActive = false}) : super(key: key);
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'my tab $index $isActive';
  }

  @override
  _MyTabState createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> with AutomaticKeepAliveClientMixin {
  final bool wantKeepAlive = true;
  int childrenCount = 2;
  bool loading = false;
  bool isActive;
  @override
  void initState() {
    super.initState();
    isActive = widget.isActive;
    print('${widget.index} initState callback');
  }

  @override
  void didChangeDependencies() {
    isActive = widget.isActive;
    print('${widget.index} didChangeDependencies callback');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(MyTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    isActive = widget.isActive;
    if (widget.isActive ^ oldWidget.isActive) {
      print('${widget.index} toggled ${widget.isActive ? '' : 'in'}active');
      pfCb(() => setState(() {}));
    }
  }

  bool onNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification &&
        widget.isActive &&
        !loading &&
        notification.metrics.extentAfter < 50) {
      load();
    }

    return false;
  }

  Future<void> load() async {
    print('${widget.index} on load');
    loading = true;
    pfCb(() {
      if (mounted) setState(() {});
    });
    await Future.delayed(Duration(seconds: 3));

    childrenCount += 3;
    pfCb(() {
      if (mounted)
        setState(() {
          loading = false;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return NotificationListener<ScrollNotification>(
      onNotification: onNotification,
      child: ListView.builder(
        controller: PrimaryScrollController.of(context),
        itemCount: childrenCount + (loading ? 1 : 0),
        itemBuilder: (context, index) => index == childrenCount
            ? Container(
                margin: EdgeInsets.all(6),
                padding: EdgeInsets.all(14),
                height: 64,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : MyBox(index: index),
      ),
    );
  }
}
