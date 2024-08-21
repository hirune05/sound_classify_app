import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; // JSON文字列を扱うために必要
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sound_classify_app/firebase_options.dart';
import 'package:sound_classify_app/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MainApp()));
}
