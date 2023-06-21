import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Provider {
  final loginProvider = StateProvider<bool>((ref) => false);

  getLoginProvider() {
    return loginProvider;
  }
}
