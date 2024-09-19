import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class DevTestPage extends StatelessWidget {
  const DevTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All APIs'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 16,),
            DelayedNoti(),
          ],
        ),
      ),
    );
  }
}

class DelayedNoti extends StatefulWidget {
  const DelayedNoti({super.key});

  @override
  State<StatefulWidget> createState() => _DelayedNotiState();
}

class _DelayedNotiState extends State<DelayedNoti> {
  int delay = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        TextField(
          controller: TextEditingController()..text = delay.toString(),
          decoration: InputDecoration(
              labelText: "Delay(s)",
              labelStyle: theme.textTheme.labelLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
              border: const OutlineInputBorder()),
          onChanged: (str) => delay = int.tryParse(str, radix: 10) ?? 0,
        ),
        ElevatedButton(
            onPressed: () {
              FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
              final aflnp = flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
              aflnp?.requestExactAlarmsPermission().then((grant) {
                if (grant == true) {
                  aflnp.requestNotificationsPermission().then((grant2) {
                    if (grant2 == true) {
                      print("xxx, ${tz.TZDateTime.now(tz.local).add(Duration(seconds: delay))}");
                      const androidNotiDetails = AndroidNotificationDetails("test_channel", "test channel");
                      const notiDetails = NotificationDetails(android: androidNotiDetails);
                      flutterLocalNotificationsPlugin.zonedSchedule(
                        99,
                        "test notification",
                        "body of noti",
                        tz.TZDateTime.now(tz.local).add(Duration(seconds: delay)),
                        notiDetails,
                        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
                        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
                      );
                    }
                  });
                }
              });
            },
            child: const Text("Schedule notification"),
        ),
        Text("Manually grants 'auto-start' permission at System Settings is required for background notification.", style: theme.textTheme.labelSmall,)
      ],
    );
  }
}

void initNoti() async {
  tz.initializeTimeZones();
  FlutterTimezone.getLocalTimezone().then((it) {
    tz.setLocalLocation(tz.getLocation(it));
  });

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (_) {});
}