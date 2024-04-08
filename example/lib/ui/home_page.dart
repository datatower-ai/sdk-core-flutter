import 'package:datatower_ai_core/datatower_ai_core.dart';
import 'package:datatower_ai_core_example/bean/sdk_info.dart';
import 'package:datatower_ai_core_example/ui/component/click_set_text.dart';
import 'package:datatower_ai_core_example/ui/component/clickable_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DT Flutter Demo'),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          toppingText("App id: ", sdkInfo?.appId),
          const SizedBox(
            height: 3,
          ),
          toppingText("Server url: ", sdkInfo?.url),
          ClickableText(
            title: "DT id",
            onClick: () =>
                DTAnalytics.getDataTowerId().then((value) => value ?? "failed"),
          ),
          const Divider(),
          const BuiltInUserPropertiesSect(),
          const Divider(),
          const EventTrackingSect(),
          const Divider(),
          const UserPropSect(),
          const Divider(),
          const AllApiSect(),
          const Divider(),
          const OthersSect(),
          const SizedBox(
            height: 10,
          ),
        ]),
      )),
    );
  }

  Widget toppingText(String pre, String? post) {
    return Center(
      child: RichText(
        text: TextSpan(
            text: pre,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.outline),
            children: [
              TextSpan(
                  text: post,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground))
            ]),
      ),
    );
  }
}

class BuiltInUserPropertiesSect extends StatelessWidget {
  const BuiltInUserPropertiesSect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("Built-in User Properties",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.primary)),
        ),
        ClickSetText(
            title: "Set #acid",
            onConfirm: (str) {
              DTAnalytics.setAccountId(str);
              return str;
            }),
        ClickSetText(
            title: "Set #distinct_id",
            onConfirm: (str) {
              DTAnalytics.setDistinctId(str);
              return str;
            }),
        ClickSetText(
            title: "Set #latest_firebase_id",
            onConfirm: (str) {
              DTAnalytics.setFirebaseAppInstanceId(str);
              return str;
            }),
        ClickSetText(
            title: "Set #latest_appsflyer_id",
            onConfirm: (str) {
              DTAnalytics.setAppsFlyerId(str);
              return str;
            }),
        ClickSetText(
            title: "Set #latest_kochava_id",
            onConfirm: (str) {
              DTAnalytics.setKochavaId(str);
              return str;
            }),
        ClickSetText(
            title: "Set #latest_adjust_id",
            onConfirm: (str) {
              DTAnalytics.setAdjustId(str);
              return str;
            }),
        ClickableText(
            title: "Get #distinct_id",
            initText: "To get the latest stored #distinct_id",
            onClick: () async {
              final id = await DTAnalytics.getDistinctId();
              if (id == null) {
                return "#distinct_id is not set";
              }
              return id;
            })
      ],
    );
  }
}

class EventTrackingSect extends StatelessWidget {
  const EventTrackingSect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("Event Tracking",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.primary)),
        ),
        ClickableText(
            title: "Track event 'dt_track_simple'",
            initText:
                "Track an event with name of 'dt_track_simple' and properties of a predefined key-value paris.",
            onClick: () async {
              DTAnalytics.trackEvent("dt_track_simple",
                  {"property_object": generatePredefinedEventProperties});
              return null;
            }),
        ClickableText(
            title: "Track event",
            initText:
                "You'll have to fill in the name of the event and its properties",
            onClick: () async {
              Navigator.pushNamed(context, "/track_event");
              return null;
            }),
        ClickableText(
            title: "Common Properties",
            initText: "Set/Clear dynamic/static common properties",
            onClick: () async {
              Navigator.pushNamed(context, "/common_properties");
              return null;
            })
      ],
    );
  }

  Map<String, dynamic> get generatePredefinedEventProperties => {
        "hero_name": "刘备",
        "hero_level": 22,
        "hero_if_support": false,
        "hero_equipment": ["雌雄双股剑", "的卢"],
        "hero_sub_obj": {
          "hero_name": "刘备",
          "hero_level": 22,
          "hero_if_support": false,
          "hero_equipment": ["雌雄双股剑", "的卢"],
        }
      };
}

class UserPropSect extends StatelessWidget {
  const UserPropSect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("User Related",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.primary)),
        ),
        ClickableText(
            title: "User related API",
            initText:
                "You'll have to fill in the name of the user api and its params",
            onClick: () async {
              Navigator.pushNamed(context, "/user_related_api");
              return null;
            })
      ],
    );
  }
}

class AllApiSect extends StatelessWidget {
  const AllApiSect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("All APIs",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.primary)),
        ),
        ClickableText(
            title: "Show all APIs in SDK",
            initText: "Show all api implemented in SDK",
            onClick: () async {
              Navigator.pushNamed(context, "/show_all_api");
              return null;
            })
      ],
    );
  }
}

class OthersSect extends StatelessWidget {
  const OthersSect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("Others",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.primary)),
        ),
        ClickableText(
            title: "Enable Upload",
            initText: "Manually enables upload (takes effect once)",
            onClick: () async {
              DT.enableUpload();
              return null;
            })
      ],
    );
  }
}
