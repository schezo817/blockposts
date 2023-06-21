import 'package:flutter/material.dart';

import '../util/myshare.dart';

class LogoBar {
  static logoBar() {
    return AppBar(
      title: Text("BlockPosts"),
      actions: [
        Myshare.myShare(),
      ],
    );
  }
}
