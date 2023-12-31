import 'package:blockposts/component/logo_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web3/flutter_web3.dart';

import '../util/design.dart';

class MessageView extends ConsumerStatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  ConsumerState<MessageView> createState() => _MessageViewState();
}

//ブロックチェーン上にメッセージを投稿する
class _MessageViewState extends ConsumerState<MessageView> {
  var sendMessage = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: LogoBar.logoBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: Design.padding(),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      "キャンセル",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      GoRouter.of(context).go('/home');
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      "投稿する",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // 投稿するボタンが押されたときの動作
                    },
                  ),
                ],
              ),
              TextFormField(
                controller: TextEditingController(text: sendMessage),
                maxLines: 99,
                style: const TextStyle(
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
                onChanged: (text) {
                  sendMessage = text;
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
