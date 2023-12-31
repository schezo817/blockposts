import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Myshare {
  //共有機能のための関数
  static void _share() => Share.share('みんなも小説を書こう!', subject: '便利な小説管理ツール');

  static Widget myShare() {
    return IconButton(
      icon: const Icon(Icons.share),
      onPressed: () => _share(),
    );
  }

//ページ遷移のための関数
  static Future movePage(BuildContext context, var pages) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pages,
      ),
    );
  }
}
