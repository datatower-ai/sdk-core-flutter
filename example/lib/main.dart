import 'package:datatower_ai_core_example/bean/sdk_info.dart';
import 'package:datatower_ai_core_example/ui/common_properties_page.dart';
import 'package:datatower_ai_core_example/ui/home_page.dart';
import 'package:datatower_ai_core_example/ui/init_page.dart';
import 'package:datatower_ai_core_example/ui/show_all_api_page.dart';
import 'package:datatower_ai_core_example/ui/track_event_page.dart';
import 'package:datatower_ai_core_example/ui/user_related_api_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent)),
        routes: {
          "/init": (_) => const InitPage(),
          "/home": (_) => const HomePage(),
          "/track_event": (_) => const TrackEventPage(),
          "/user_related_api": (_) => const UserRelatedApiPage(),
          "/show_all_api": (_) => const ShowAllApiPage(),
          "/common_properties": (_) => const CommonPropertiesPage(),
        },
        initialRoute: sdkInfo == null ? "/init" : "/home");
  }
}
