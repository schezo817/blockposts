import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../util/auth_controller.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

final authControllerProvider = StateNotifierProvider<AuthController, bool>((ref) => AuthController());
class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = ref.watch(authControllerProvider);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: 20,
            itemBuilder: (context, index) {
              // EtherScanから投稿を取得して表示する
              // ここに投稿をクリックしたら詳細に遷移するボタンを書く

              return ListTile(
                leading: Icon(Icons.message),
                title: Text('User $index'),
                subtitle: Text('Meesage $index'),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // if(非ログイン状態)ならログイン画面に遷移する
            // elseならポップアップで投稿メッセージを入力する欄を表示する
            if(isLoggedIn){
              GoRouter.of(context).go('/message');
            }else{
              GoRouter.of(context).go('/login');
            }
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
