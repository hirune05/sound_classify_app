import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sound_classify_app/thems/app_theme.dart';
import 'package:sound_classify_app/ui/pages/page_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainApp extends ConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext contest, WidgetRef ref) {
    return MaterialApp.router(
      title: 'SoundFit',
      theme: appTheme(contest),
      routerConfig: ref.watch(routerProvider),
    );
  }


  Future<void> sendDataToFlask(Map<String, dynamic> data) async {
    final url = Uri.parse('http://hogehoge.com/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Flask からの応答を処理する
      final responseData = jsonDecode(response.body);
      print('Response from Flask: $responseData');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }
}

