import 'package:blockposts/util/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web3/flutter_web3.dart';
import '../util/auth_controller.dart';
import '../util/design.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

//Metamask連携を行うボタンを配置する
class _LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Container(
          padding: Design.padding(),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const StadiumBorder(),
            ),
            child: const Text(
              "MetaMaskに連携",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              await ethereum!.requestAccount();
              ref.read(authControllerProvider.notifier).login();
              GoRouter.of(context).go('/message');
            },
          ),
        ),
      ),
    );
  }
}
