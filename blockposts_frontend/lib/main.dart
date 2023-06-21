import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blockposts/route/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerDelegate: ref.watch(router).routerDelegate,
      routeInformationParser: ref.watch(router).routeInformationParser,
      routeInformationProvider: ref.watch(router).routeInformationProvider,
      title: "BlockPosts",
      debugShowCheckedModeBanner: false,
    );
  }
}
