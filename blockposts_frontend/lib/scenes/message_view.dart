import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web3/flutter_web3.dart';

class MessageView extends ConsumerStatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  ConsumerState<MessageView> createState() => _MessageViewState();
}

//Metamask連携を行うボタンを配置する
class _MessageViewState extends ConsumerState<MessageView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Column(children: <Widget>[
            Text(
              "ここはメッセージを送信する画面です",
            ),
          ]),
        ),
      ),
    );
  }
}