import 'package:flutter/widgets.dart';

void pfCb(VoidCallback x) =>
    WidgetsBinding.instance.addPostFrameCallback((_) => x());
