import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider.dart';

class AuthController extends StateNotifier<bool> {
  AuthController() : super(false);

  void login() {
    state = true; // ログイン状態をtrueに設定
  }

  void logout() {
    state = false; // ログイン状態をfalseに設定
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) => AuthController());
